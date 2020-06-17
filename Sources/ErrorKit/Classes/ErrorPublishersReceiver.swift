//
//  File.swift
//  
//
//  Created by Nomad Company on 6/17/20.
//

import Combine
/**
 This class is meant to be the internal receiver of `Errors` which are published from an app via the `ErrorPublishers` struct.
 
 Simply initalizing this class sets up the subscriptions to the publishers. You can initalize this calss anywhere in the App but keeping it alive at the AppDelegate or SceneDelegate level will ensure it is around the lifecycle of the app.
 
 BEHAVIOR:
 
 1) If an error which confirms to the `ErrorPrintable` protocol is received then the error is printed to the terminal.
 2) If an `Error` type is received then it is checked to be of `ErrorPrintable` type and passed along accordingly. If not then it uses the `.title` and `.message` properties of the `Error` to print out a message to the console.
 */
public class ErrorPublishersReceiver {
    //MARK: Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    private var verbosity: Verbosity = Verbosity.ERROR
    
    private let keyCreator: KeyCreator = KeyCreator.init()
    
    //MARK: Init
    /// Initalize the class and sets up the `Combine` Subscriptions.
    public init() {
        let verbosityChangeSubscription = ErrorPublishers.changeVerbosity.sink { (newVerbosity) in
            self.verbosity = newVerbosity
        }
        
        let errorSubscription = ErrorPublishers.newError.sink { (newError) in
            guard self.verbosity == Verbosity.ERROR else {
                return
            }
            if let printableError = newError as? ErrorPrintable {
                print(printableError.humanReadableString())
            }else {
                print("\(newError.title) -> \(newError.message)")
            }
            let newException = Exception.init(error: newError)
            self.post(exception: newException)
        }
        
        let messageSubscription = ErrorPublishers.newMessage.sink { (newMessage) in
            guard self.verbosity == .ERROR || self.verbosity == .MESSAGE else {
                return
            }
            print("Title -> \(newMessage.title ?? "No Title"), Message -> \(newMessage.message ?? "No Message")")
            let newException = Exception.init(message: newMessage)
            self.post(exception: newException)
        }
        
        let exceptionPackageSubscription = ErrorPublishers.newExceptionPackage.sink { (package) in
            
        }
        
        self.subscriptions.insert(verbosityChangeSubscription)
        self.subscriptions.insert(errorSubscription)
        self.subscriptions.insert(messageSubscription)
        self.subscriptions.insert(exceptionPackageSubscription)
    }
    
    //MARK: functions
    
    private func post(exception: Exception) {
        let key: String = self.keyCreator.makeKey(forException: exception)
        let package: ExceptionPackage = ExceptionPackage.init(exception: exception, key: key)
        ErrorPublishers.newExceptionPackage.send(package)
    }
    
    
    //MARK: De- Init
    deinit {
        for item in self.subscriptions {
           item.cancel()
        }
        self.subscriptions.removeAll()
    }
    
}

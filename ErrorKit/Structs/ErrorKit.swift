//
//  ErrorKit.swift
//  ErrorKit
//
//  Created by Nomad Company on 11/15/19.
//  Copyright © 2019 Nomad Company. All rights reserved.
//

import Foundation


public typealias ExceptionLog = (key: String, exception: Exception)

public struct ErrorKit {
    //MARK: Static Properties
    static public var logging = true
    static public var logToConsole = true
    
    //MARK: Static Functions
    static public func quickInfo(title: String?, message: String?) {
        guard ErrorKit.logging == true else {
            return
        }
        
        if ErrorKit.logToConsole == true {
            print("\(title ?? "New Info Log") -> \(message ?? "No Info")")
        }
        let exception = Exception(title: title, message: message)
        ErrorKit.post(exception: exception)
    }
    
    static public func quickError(error: Error) {
        guard ErrorKit.logging == true else {
            return
        }
        
        if ErrorKit.logToConsole == true {
            print("\(error.title) -> \(error.message)")
        }
        let exception = Exception(error: error)
        ErrorKit.post(exception: exception)
    }
    
    static func post(exception: Exception) {
        let keyCreator = KeyCreator()
        let key = keyCreator.makeKey(forException: exception)
        let log = (key, exception)
        NotificationCenter.default.post(name: NewErrorKitException, object: log)
    }
}

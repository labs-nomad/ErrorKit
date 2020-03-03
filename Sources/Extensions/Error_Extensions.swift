//
//  Error_Extensions.swift
//  ErrorKit
//
//  Created by Nomad Company on 11/15/19.
//  Copyright © 2019 Nomad Company. All rights reserved.
//

import Foundation


public extension Error {
    
    /// The title of the Error. Will return "Error with code: <code>, From domain: <domain>"
    var title: String {
        let title = "Error with code: \(self.code), From domain: \(self.domain)"
        return title
    }
    
    /// The human readable portion of the Error. Checks to see if the Error conforms to the `ErrorPrintable` protocol. If not then it tries to convert it into an `NSError` and ge the message or localizedDescription.
    var message: String {
        if let printableError = self as? ErrorPrintable {
            return printableError.humanReadableString()
        }else {
            var messageToDisplay: String!
            let nsError = self as NSError
            if let message = nsError.userInfo["message"] as? String {
                messageToDisplay = message
            }else {
                messageToDisplay = nsError.localizedFailureReason ?? nsError.localizedDescription
            }
            return messageToDisplay
        }
    }
    
    /// Attempts to cast the `Error` as an `NSError` and then read the `.code` property
    var code: Int {
        let nsError = self as NSError
        return nsError.code
    }
    /// Attempts to cast the `Error` as an `NSError` and then read the `.domain` property
    var domain: String {
        let nsError = self as NSError
        return nsError.domain
    }
    
}

//
//  Notifications.swift
//  ErrorKit
//
//  Created by Nomad Company on 11/15/19.
//  Copyright © 2019 Nomad Company. All rights reserved.
//

import Foundation

/// Notification that get fired everytime there is a new `Error` object that gets passed into the `ErrorKit`. It will post  an `ExceptionLog` which is a tuple in this format `(key: String, exception: Exception)`
public let NewErrorKitException = Notification.Name.init("NewErrorKitException")

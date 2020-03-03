//
//  ErrorType.swift
//  ErrorKit
//
//  Created by Nomad Company on 11/15/19.
//  Copyright © 2019 Nomad Company. All rights reserved.
//

import Foundation


/// The type of error that you want to log.
public enum ExceptionType: String {
    case error
    case info
}

extension ExceptionType: Equatable {
    public static func == (lhs: ExceptionType, rhs: ExceptionType) -> Bool {
        switch (lhs, rhs) {
        case (ExceptionType.error, ExceptionType.error):
            return true
        case (ExceptionType.info, ExceptionType.info):
            return true
        default:
            return false
        }
    }
}

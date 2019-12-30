//
//  Date_Extensions.swift
//  ErrorKit
//
//  Created by Nomad Company on 11/15/19.
//  Copyright © 2019 Nomad Company. All rights reserved.
//

import Foundation


extension Date {
    static var millisecondsUTC: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZ"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: Date())
    }
    
    var millisecondsUTC: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZ"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: Date())
    }
}

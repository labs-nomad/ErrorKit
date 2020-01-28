//
//  KeyCreator.swift
//  ErrorKit
//
//  Created by Nomad Company on 11/15/19.
//  Copyright © 2019 Nomad Company. All rights reserved.
//

import UIKit


public struct KeyCreator {
    
    
    //MARK: Init
    public init() {
        
    }
    
    //MARK: Functions
    /// Function that gets a partition key for a timestamp in the format of year=yyyy/month=MM/day=dd/hour=HH
    /// - Parameter date: The date that you want to construct the has from
    public func getTimePartition(_ date: Date = Date()) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        formatter.dateFormat = "HH"
        let hour = formatter.string(from: date)
        return "year=\(year)/month=\(month)/day=\(day)/hour=\(hour)"
    }
    
    
    /// Takes the `ErrorPrintable` object and first checks for the bundle ID then adds the time partition. Finally a UUID has for the JSON file name.
    /// - Parameter exception: The resulting key ready for upload into S3
    public func makeKey(forException exception: Exception) -> String {
        var key: String = ""
        if let bundleID = Bundle.main.bundleIdentifier {
            key.append("bundleID=\(bundleID)/")
        }
        key.append("level=\(exception.type)/")
        key.append(self.getTimePartition())
        key.append("/errorID=\(exception.id)/\(exception.id).json")
        return key
    }
}

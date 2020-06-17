//
//  Exception.swift
//  ErrorKit
//
//  Created by Nomad Company on 11/15/19.
//  Copyright © 2019 Nomad Company. All rights reserved.
//

import Foundation


public struct Exception: Encodable {
    public let id = UUID().uuidString
    public let created_at = Date.millisecondsUTC
    public let title: String
    public let message: String
    public let type: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case created_at
        case title
        case message
        case type
    }
    
    public init(message: Message, type: ExceptionType = .info) {
        self.title = message.title ?? "No Title"
        self.message = message.message ?? "No Message"
        self.type = type.rawValue
    }
    
    public init(error: Error, type: ExceptionType = .error) {
        self.title = error.title
        self.message = error.message
        self.type = type.rawValue

    }
}

//
//  File.swift
//  
//
//  Created by Nomad Company on 6/17/20.
//

import Combine

/// Struct that holds Combine publishers as static properties to help with Error coordination through the App. The goal is that any code in an App can publish errors or messages using these publishers.
public struct ErrorPublishers {
    /// We received an new `Error`
    static public let newError: PassthroughSubject<Error, Never> = PassthroughSubject<Error, Never>()
    /// We received a new message
    static public let newMessage: PassthroughSubject<Message, Never> = PassthroughSubject<Message, Never>()
    /// We want ot know when the `Verbosity` level changes
    static public let changeVerbosity: CurrentValueSubject<Verbosity, Never> = CurrentValueSubject<Verbosity, Never>(Verbosity.ERROR)
    /// We want to gather the Exception Packages into a pipeline.
    static public let newExceptionPackage: PassthroughSubject<ExceptionPackage, Never> = PassthroughSubject<ExceptionPackage, Never>()
}

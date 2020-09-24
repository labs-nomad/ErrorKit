//
//  ExceptionPackage.swift
//  
//
//  Created by Nomad Company on 6/17/20.
//

import Foundation



/// The end result of an exception. Contains the exception and the key for uploading
public struct ExceptionPackage: Encodable {
    
    /// The `Exception` package
    public let exception: Exception
    /// The key for the exception package
    public let key: String
    
    
}

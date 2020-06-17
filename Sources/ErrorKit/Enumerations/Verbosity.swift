//
//  Verbosity.swift
//  
//
//  Created by Nomad Company on 6/17/20.
//

import Foundation


/// How dense do you want the logs. Will be reflected in the terminal output as well as the output of packaged logs to potentially be sent up to a server.
public enum Verbosity {
    case ERROR
    case MESSAGE
    case NONE
}

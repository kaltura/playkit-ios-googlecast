// ===================================================================================================
// Copyright (C) 2017 Kaltura Inc.
//
// Licensed under the AGPLv3 license, unless a different license for a 
// particular library is specified in the applicable library path.
//
// You may obtain a copy of the License at
// https://www.gnu.org/licenses/agpl-3.0.html
// ===================================================================================================

import XCGLogger

/// `PKGCLogLevel` describes the available log levels.
@objc public enum PKGCLogLevel: Int {
    case verbose, debug, info, warning, error
    
    static let `default` = PKGCLogLevel.debug
    
    var description: String {
        return String(describing: self).uppercased()
    }
    
    /// Converts our levels to the levels of logger we wrap
    var toLoggerLevel: XCGLogger.Level {
        switch self {
        case .verbose: return .verbose
        case .debug: return .debug
        case .info: return .info
        case .warning: return .warning
        case .error: return .error
        }
    }
}

public let PKGCLog: XCGLogger = {
    let logger = XCGLogger(identifier: "PlayKitGoogleCast")
    logger.outputLevel = PKGCLogLevel.default.toLoggerLevel
    return logger
}()

//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 23.11.2020.
//

import Foundation

public enum Environment: String {
    
    // MARK: - Environments
    case development
    case staging
    case production
    
    // MARK: - Current Environment
    public static let current: Environment = {
        // Read Value From Info.plist
        guard let value = Bundle.main.infoDictionary?["CONFIGURATION"] as? String else {
            // Define Environment based on debug release
            #if DEBUG
            return .development
            #else
            return .production
            #endif
        }

        // Create Environment
        guard let environment = Environment(rawValue: value.lowercased()) else {
            fatalError("Invalid Environment")
        }

        return environment
    }()
    
    
    public static var appName: String {
        return AppInfo.CFBundleName
    }
    
    public static var appVersion: String {
        return AppInfo.CFBundleShortVersionString
    }
    
    public static var appBuild: String {
        return AppInfo.CFBundleVersion
    }
    
}

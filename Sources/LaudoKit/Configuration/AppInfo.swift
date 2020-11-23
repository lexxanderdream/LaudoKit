//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 23.11.2020.
//

import Foundation

public struct AppInfo {
    
    public static func value<T>(for key: String) -> T {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? T else {
            fatalError("Key \(key) not found in bundle")
        }
        
        return value
    }
    
    public static var CFBundleIdentifier: String {
        return value(for: "CFBundleIdentifier")
    }
    
    public static var DTPlatformName: String {
        return value(for: "DTPlatformName")
    }
    
    public static var UIMainStoryboardFile: String {
        return value(for: "UIMainStoryboardFile")
    }
    
    public static var CFBundleVersion: String {
        return value(for: kCFBundleVersionKey as String)
    }
    
    public static var CFBundleSignature: String {
        return value(for: "CFBundleSignature")
    }
    
    public static var CFBundleExecutable: String {
        return value(for: "CFBundleExecutable")
    }
    
    public static var LSRequiresIPhoneOS: Int {
        return value(for: "LSRequiresIPhoneOS")
    }
    
    public static var CFBundleName: String {
        return value(for: "CFBundleName")
    }
    
    public static var UILaunchStoryboardName: String {
        return value(for: "UILaunchStoryboardName")
    }
    
    public static var CFBundleSupportedPlatforms: Array<String> {
        return value(for: "CFBundleSupportedPlatforms")
    }
    
    public static var CFBundlePackageType: String {
        return value(for: "CFBundlePackageType")
    }
    
    public static var CFBundleNumericVersion: Int {
        return value(for: "CFBundleNumericVersion")
    }
    
    public static var CFBundleInfoDictionaryVersion: String {
        return value(for: "CFBundleInfoDictionaryVersion")
    }
    
    public static var UIRequiredDeviceCapabilities: Array<String> {
        return value(for: "UIRequiredDeviceCapabilities")
    }
    
    public static var UISupportedInterfaceOrientations: Array<String> {
        return value(for: "UISupportedInterfaceOrientations")
    }
    
    public static var CFBundleInfoPlistURL: String {
        return value(for: "CFBundleInfoPlistURL")
    }
    
    public static var CFBundleDevelopmentRegion: String {
        return value(for: "CFBundleDevelopmentRegion")
    }
    
    public static var DTSDKName: String?{
        return value(for: "DTSDKName")
    }
    
    public static var UIDeviceFamily: Array<Int> {
        return value(for: "UIDeviceFamily")
    }
    
    public static var CFBundleShortVersionString: String {
        return value(for: "CFBundleShortVersionString")
    }
}


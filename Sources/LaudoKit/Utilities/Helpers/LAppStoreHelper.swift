//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 14.06.2020.
//

import Foundation
import StoreKit

let Defaults = UserDefaults.standard

@available(iOS 10.3, *)
public struct LAppStoreHelper {
    
    static let processCompletedCountKey = "APP_OPENED_COUNT"
    static let lastVersionPromptedForReviewKey = "LAST_VERSION_PROMPTED_FOR_REVIEW"
    
    /**
     called from appdelegate didfinishLaunchingWithOptions:
     */
    static func incrementAppOpenedCount() {
        var appOpenCount = Defaults.integer(forKey: processCompletedCountKey)
        appOpenCount += 1
        Defaults.set(appOpenCount, forKey: processCompletedCountKey)
    }
    
    /**
     call this whenever appropriate
     this will not be shown everytime. Apple has some internal logic on how to show this.
     */
    public static func checkAndAskForReview() {
        guard let appOpenCount = Defaults.value(forKey: processCompletedCountKey) as? Int else {
            Defaults.set(1, forKey: processCompletedCountKey)
            return
        }
        
        switch appOpenCount {
        case 10,50:
            LAppStoreHelper().requestReview()
        case _ where appOpenCount%100 == 0 :
            LAppStoreHelper().requestReview()
        default:
            print("App run count is : \(appOpenCount)")
            break;
        }
        
    }
    
    public init() {
        
    }
    
    public func requestReview() {
        // Get the current bundle version for the app
        guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
            else { fatalError("Expected to find a bundle version in the info dictionary") }
        
        let lastVersionPromptedForReview = Defaults.string(forKey: Self.lastVersionPromptedForReviewKey)
        
        if currentVersion != lastVersionPromptedForReview {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                SKStoreReviewController.requestReview()
                UserDefaults.standard.set(currentVersion, forKey: Self.lastVersionPromptedForReviewKey)
            }
        }
    }
    
    public func requestReviewInStore(appId: String) {
        guard let writeReviewURL = URL(string: "https://itunes.apple.com/app/id\(appId)?action=write-review")
            else { fatalError("Expected a valid URL") }
        
        UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
    }
    
    
    public func manageSubscriptions() {
        guard let subscriptionsURL = URL(string: "itms-apps://apps.apple.com/account/subscriptions") else { return }
        
        UIApplication.shared.open(subscriptionsURL, options: [:])
    }
}


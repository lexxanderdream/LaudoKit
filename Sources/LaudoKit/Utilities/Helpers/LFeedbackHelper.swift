//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 14.06.2020.
//

import UIKit
import MessageUI

open class LFeedbackHelper: NSObject {
    
    // MARK: - Internal Properties
    private let supportEmail: String
    private let subject: String
    
    
    // MARK: - Initialization
    public init(supportEmail email: String, subject: String) {
        self.supportEmail = email
        self.subject = subject
    }
    
    public func sendMail(in viewController: UIViewController) {
        if !MFMailComposeViewController.canSendMail() {
            LAlertPresenter.makeAndPresent(in: viewController, title: "Email not set up", acceptTitle: "OK", message: "You did not set up any email accounts on this device", handler: nil)
            return
        }
        
        let body =
"""




----
\(AppInfo.CFBundleName): \(AppInfo.CFBundleShortVersionString) (\(AppInfo.CFBundleVersion))
OS: \(UIDevice.current.systemName) \(UIDevice.current.systemVersion as NSString)
Device: \(UIDevice.modelName)
Locale: \(Locale.current)
"""
        
        let mailViewController = MFMailComposeViewController()
        mailViewController.mailComposeDelegate = self
        mailViewController.setToRecipients([supportEmail])
        mailViewController.setSubject(subject)
        mailViewController.setMessageBody(body, isHTML: false)
        viewController.present(mailViewController, animated: true, completion: nil)
    }
}

extension LFeedbackHelper: MFMailComposeViewControllerDelegate {
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
         controller.dismiss(animated: true)
    }
}

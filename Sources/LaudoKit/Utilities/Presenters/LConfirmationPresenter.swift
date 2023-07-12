//
//  LConfirmationPresenter.swift
//
//  Created by Alexander Zhuchkov on 29/08/2019.
//  Copyright © 2019 IT4YOU. All rights reserved.
//

import UIKit

public struct LConfirmationPresenter {
    
    /// Question we want the user to confirm
    var question: String?
    
    /// Description of confirmation
    var description: String?
    
    /// Title of the button to accept the confirmation
    let acceptTitle: String
    
    /// Title of the button to reject the confirmation
    let rejectTitle: String
    
    /// A closure to be run when the user taps accept button
    let handler: () -> Void
    
    // MARK: - Helper Methods
    private func makeAlertController() -> UIAlertController {
        // Initializer alert controller
        let alertController = UIAlertController(
            title: question,
            message: description,
            preferredStyle: .actionSheet
        )
        
        // Add accept action
        let defaultAction = UIAlertAction(title: acceptTitle, style: .destructive) { _ in
            self.handler()
        }
        alertController.addAction(defaultAction)
        
        // Add cancel action
        let cancelAction = UIAlertAction(title: rejectTitle, style: .cancel)
        alertController.addAction(cancelAction)
    }
    
    // MARK: - Methods
    public func present(in viewController: UIViewController, barButtonItem: UIBarButtonItem) {
        
        // Initialize Alert Controller
        let alertController = makeAlertController()
        
        // Setup PopoverPresentationController
        alertController.popoverPresentationController?.barButtonItem = barButtonItem
        
        // Present Alert Controller
        viewController.present(alertController, animated: true)
    }
    
    public func present(in viewController: UIViewController, sourceView: UIView, sourceRect: CGRect? = nil) {
        // Initialize Alert Controller
        let alertController = makeAlertController()
        
        // Setup PopoverPresentationController
        alertController.popoverPresentationController?.sourceView = sourceView
        alertController.popoverPresentationController?.sourceView = sourceRect ?? sourceView.bounds
        
        // Present Alert Controller
        viewController.present(alertController, animated: true)
    }
}

// MARK: - Custom Initialization
public extension LConfirmationPresenter {
    init(acceptTitle: String, rejectTitle: String, handler: @escaping () -> Void) {
        self.init(question: nil, description: nil, acceptTitle: acceptTitle, rejectTitle: rejectTitle, handler: handler)
    }
    
    init(question: String, acceptTitle: String, rejectTitle: String, handler: @escaping () -> Void) {
        self.init(question: question, description: nil, acceptTitle: acceptTitle, rejectTitle: rejectTitle, handler: handler)
    }
}

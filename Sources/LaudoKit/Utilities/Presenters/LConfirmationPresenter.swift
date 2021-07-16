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
    
    
    // MARK: - Methods
    public func present(in viewController: UIViewController) {
        
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
        
        // Present Alert Controller
        viewController.present(alertController, animated: true)
    }
}

public extension LConfirmationPresenter {
    init(acceptTitle: String, rejectTitle: String, handler: @escaping () -> Void) {
        self.init(question: nil, description: nil, acceptTitle: acceptTitle, rejectTitle: rejectTitle, handler: handler)
    }
    
    init(question: String, acceptTitle: String, rejectTitle: String, handler: @escaping () -> Void) {
        self.init(question: question, description: nil, acceptTitle: acceptTitle, rejectTitle: rejectTitle, handler: handler)
    }
}

public extension LConfirmationPresenter {
    static func makeAndPresent(in viewController: UIViewController, acceptTitle: String, rejectTitle: String, handler: @escaping (() -> Void)) {
        
        let presenter = LConfirmationPresenter(acceptTitle: acceptTitle, rejectTitle: rejectTitle, handler: handler)
        
        presenter.present(in: viewController)
    }
    
    static func makeAndPresent(in viewController: UIViewController, question: String, acceptTitle: String, rejectTitle: String, handler: @escaping (() -> Void)) {
        
        let presenter = LConfirmationPresenter(question: question, acceptTitle: acceptTitle, rejectTitle: rejectTitle, handler: handler)
        
        presenter.present(in: viewController)
    }
    
    
}

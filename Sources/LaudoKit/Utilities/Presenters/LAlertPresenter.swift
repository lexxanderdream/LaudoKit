//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 14.06.2020.
//

import UIKit

public struct LAlertPresenter {
    
    /// Title we want to display to the user
    var title: String
    
    /// Description message
    var message: String?
    
    /// Title of the button to accept the confirmation
    let acceptTitle: String
    
    /// Title of the button to reject the confirmation
    let rejectTitle: String?
    
    /// A closure to be run when the user taps accept button
    let handler: (Outcome) -> Void
    
    
    // MARK: - Initialization
    public init(title: String, message: String? = nil, acceptTitle: String, rejectTitle: String?, handler: @escaping (LAlertPresenter.Outcome) -> Void) {
        self.title = title
        self.message = message
        self.acceptTitle = acceptTitle
        self.rejectTitle = rejectTitle
        self.handler = handler
    }
    
    // MARK: - Methods
    public func present(in viewController: UIViewController) {
        
        // Initializer alert controller
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        // Add accept action
        let acceptAction = UIAlertAction(title: acceptTitle, style: .default) { _ in
            self.handler(.accepted)
        }
        alertController.addAction(acceptAction)
        
        // Add reject action
        if let rejectTitle = rejectTitle {
            let rejectAction = UIAlertAction(title: rejectTitle, style: .cancel) { _ in
                self.handler(.rejected)
            }
            alertController.addAction(rejectAction)
        }
        
        // Present Alert Controller
        viewController.present(alertController, animated: true)
    }
}

public extension LAlertPresenter {
    enum Outcome {
        case accepted
        case rejected
    }
}

public extension LAlertPresenter {
    static func makeAndPresent(in viewController: UIViewController, title: String, acceptTitle: String, message: String? = nil, handler: (() -> Void)? = nil) {
        let presenter = LAlertPresenter(title: title, message: message, acceptTitle: acceptTitle, rejectTitle: nil) { _ in
            handler?()
        }
        presenter.present(in: viewController)
    }
}

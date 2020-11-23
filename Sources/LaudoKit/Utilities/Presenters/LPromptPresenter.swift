//
//  PromptPresenter.swift
//  UrbanPlayer
//
//  Created by Alexander Zhuchkov on 29/08/2019.
//  Copyright © 2019 IT4YOU. All rights reserved.
//

import UIKit

public class LPromptPresenter {
    
    /// Title of alert
    var title: String
    
    /// Text input placeholder
    var placeholder: String
    
    /// Default text in input
    var defaultText: String?
    
    /// Accept action title
    var acceptTitle: String
    
    /// Cancel action title
    var cancelTitle: String
    
    /// Handler
    var handler: (String) -> Void
    
    private var acceptAction: UIAlertAction?
    
    // MARK: - Initializer
    public init(title: String, placeholder: String, acceptTitle: String, cancelTitle: String, defaultText: String? = nil, handler: @escaping (String) -> Void) {
      
        self.title = title
        self.placeholder = placeholder
        self.acceptTitle = acceptTitle
        self.cancelTitle = cancelTitle
        self.defaultText = defaultText
        self.handler = handler
    }
    
    
    // MARK: - Methods
    public func present(in viewController: UIViewController) {
        
        // Initializer alert controller
        let alertController = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .alert
        )
        
        // Add Text field
        alertController.addTextField { textField in
            textField.placeholder = self.placeholder
            textField.text = self.defaultText
            textField.addTarget(self, action: #selector(self.alerTextChanged(_:)), for: .editingChanged)
        }
        
        // Add accept action
        let acceptAction = UIAlertAction(title: acceptTitle, style: .default) { _ in
            let textField = alertController.textFields!.first!
            self.acceptAction = nil
            self.handler(textField.text ?? "")
        }
        acceptAction.isEnabled = false
        self.acceptAction = acceptAction
        alertController.addAction(acceptAction)
        
        // Add cancel action
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { _ in
            self.acceptAction = nil
        }
        alertController.addAction(cancelAction)
        
        // Present Alert Controller
        viewController.present(alertController, animated: true)
        
    }
    
    @objc func alerTextChanged(_ sender: UITextField) {
        if let action = acceptAction {
            action.isEnabled = (sender.text == "") ? false : true
        }
    }
}

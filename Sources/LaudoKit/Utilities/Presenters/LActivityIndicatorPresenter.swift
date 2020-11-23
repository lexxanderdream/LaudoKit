//
//  ActivityIndicatorPresenter.swift
//  UrbanPlayer
//
//  Created by Alexander Zhuchkov on 05.11.2019.
//  Copyright © 2019 IT4YOU. All rights reserved.
//

import UIKit

public struct LActivityIndicatorPresenter {
    
    func present(in viewController: UIViewController) {
        
        // Initializer alert controller
        let alertController = UIAlertController(
            title: nil,
            message: "Please wait...",
            preferredStyle: .alert
        )
        
        // Add activity indicator
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.startAnimating()
        
        alertController.view.addSubview(activityIndicator)
        
        // Present Alert Controller
        viewController.present(alertController, animated: true)
    }
}

public extension LActivityIndicatorPresenter {
    static func makeAndPresent(in viewController: UIViewController) {
        let presenter = Self()
        presenter.present(in: viewController)
    }
    
    static func dismiss(in viewController: UIViewController) {
        if let alert = viewController.presentedViewController {
            alert.dismiss(animated: false, completion: nil)
        }
    }
}

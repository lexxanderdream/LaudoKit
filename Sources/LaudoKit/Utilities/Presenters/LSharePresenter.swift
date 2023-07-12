//
//  SharePresenter.swift
//
//  Created by Alexander Zhuchkov on 10.02.2020.
//  Copyright © 2020 Alexander Zhuchkov. All rights reserved.
//

import UIKit

public struct LSharePresenter {
    
    /// Items for sharing
    let items: [Any]
    
    /// Activity types to be excluded
    let excludedActivityTypes: [UIActivity.ActivityType]?
    
    // MARK: - Initialization
    public init(items: [Any], excludedActivityTypes: [UIActivity.ActivityType]? = nil) {
        self.items = items
        self.excludedActivityTypes = excludedActivityTypes
    }
    
    // MARK: - Public API
    func present(in viewController: UIViewController, sender: Any?) {
                    
        // Initialize Share Controller
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        // Setup
        activityController.excludedActivityTypes = excludedActivityTypes
                    
        // Configure Share Controller
        if let barButtonItem = sender as? UIBarButtonItem {
            activityController.popoverPresentationController?.barButtonItem = barButtonItem
        } else if let sourceView = sender as? UIView {
            activityController.popoverPresentationController?.sourceView = sourceView
            activityController.popoverPresentationController?.sourceRect = sourceView.bounds
        }
        
        // Present Share Controller
        viewController.present(activityController, animated: true, completion: nil)
        
    }
}

public extension LSharePresenter {
    static func makeAndPresent(items: [Any], in viewController: UIViewController, sender: Any?) {
        let presenter = LSharePresenter(items: items)
        presenter.present(in: viewController, sender: sender)
    }
}

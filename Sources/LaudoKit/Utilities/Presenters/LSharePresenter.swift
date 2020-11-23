//
//  SharePresenter.swift
//
//  Created by Alexander Zhuchkov on 10.02.2020.
//  Copyright © 2020 Alexander Zhuchkov. All rights reserved.
//

import UIKit

public struct LSharePresenter {
    
    /// Items for sharing
    var items: [Any]
    
    func present(in viewController: UIViewController, sender: UIBarButtonItem? = nil) {
                    
        // Initialize Share Controller
        let shareController = UIActivityViewController(activityItems: items, applicationActivities: nil)
                    
        // Configure Share Controller
        shareController.popoverPresentationController?.barButtonItem = sender
                    
        // Present Share Controller
        viewController.present(shareController, animated: true, completion: nil)
        
    }
}

public extension LSharePresenter {
    static func makeAndPresent(items: [Any], in viewController: UIViewController, sender: UIBarButtonItem? = nil) {
        let presenter = LSharePresenter(items: items)
        presenter.present(in: viewController, sender: sender)
    }
}

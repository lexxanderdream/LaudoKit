//
//  LPickerPresenter.swift

//
//  Created by Alexander Zhuchkov on 30/08/2019.
//  Copyright © 2019 IT4YOU. All rights reserved.
//

import UIKit

public struct LPickerPresenter<Item: Equatable & CustomStringConvertible> {
    
    /// Title of radio button list
    var title: String?
    
    /// Radio button list
    var items: [Item]
    
    /// Currently selected item index
    var selected: Item?
    
    /// Title of cancel button
    var rejectTitle: String
    
    /// Text alignment
    var itemTextAlignment = CATextLayerAlignmentMode.left
    
    /// A closure to be run when the user taps item
    var handler: (Item) -> Void
    
    public func present(in viewController: UIViewController, sender: UIBarButtonItem? = nil) {
        
        // Initializer alert controller
        let alertController = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .actionSheet
        )
        
        // Add accept action
        items.forEach { (item) in
            let itemAction = UIAlertAction(title: String(describing: item), style: .default) { _ in
                self.handler(item)
            }
            
            if itemTextAlignment != .center {
                itemAction.setValue(self.itemTextAlignment, forKey: "titleTextAlignment")
            }
            if item == selected  {
                itemAction.setValue(true, forKey: "checked")
            }
            
            alertController.addAction(itemAction)
        }
        
        // Add cancel action
        let cancelAction = UIAlertAction(title: rejectTitle, style: .cancel)
        alertController.addAction(cancelAction)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.barButtonItem = sender
        }
        
        // Present Alert Controller
        viewController.present(alertController, animated: true)
    }
    
}

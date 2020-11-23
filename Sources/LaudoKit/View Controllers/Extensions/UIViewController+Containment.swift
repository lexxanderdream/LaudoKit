//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 23.11.2020.
//

import UIKit

public extension UIViewController {
    
    func add(_ child: UIViewController, into view: UIView? = nil) {
        
        let parentView: UIView = {
            if let view = view {
                return view
            }
            
            return self.view
        }()
        
        // add child view controller
        addChild(child)
        
        // add child view as subview
        parentView.addSubview(child.view)
        
        // Configure Child View
        child.view.frame = parentView.bounds
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        // notify child view controller
        child.didMove(toParent: self)
    }
    
    func remove() {

        // notify parent
        willMove(toParent: nil)
        
        // remove child from superview
        view.removeFromSuperview()
        
        // remove child view controller
        removeFromParent()
    }
    
    func replace(viewController fromViewController: UIViewController?, with toViewController: UIViewController?) {
        
        if let viewController = fromViewController {
            viewController.remove()
        }
        
        if let viewController = toViewController {
            add(viewController)
        }
    }
}

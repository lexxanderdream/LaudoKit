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


public extension UIViewController {
    func replaceAnimated(viewController fromViewController: UIViewController, with toViewController: UIViewController, completion: (() -> Void)? = nil) {
        
        let initialFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        let finalFrame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: view.bounds.height)
        
        fromViewController.willMove(toParent: nil)
        
        addChild(toViewController)

        fromViewController.view.frame = initialFrame
        
        transition(from: fromViewController, to: toViewController, duration: 0.66, options: [.curveEaseIn], animations: {
            self.view.bringSubviewToFront(fromViewController.view)
            fromViewController.view.frame = finalFrame
            
        }) { (completed) in
            // Remove child view controller
            fromViewController.removeFromParent()
            
            // Notify child view controller
            toViewController.didMove(toParent: self)
            
            // Call Completion Handler
            completion?()
        }
        
    }
    
    func replaceFromRightAnimated(viewController fromViewController: UIViewController, with toViewController: UIViewController, completion: (() -> Void)? = nil) {
        
        fromViewController.willMove(toParent: nil)
        
        addChild(toViewController)
        
        transition(from: fromViewController, to: toViewController, duration: 0.66, options: [.transitionFlipFromRight], animations: {
            
        }) { (completed) in
            // Remove child view controller
            fromViewController.removeFromParent()
            
            // Notify child view controller
            toViewController.didMove(toParent: self)
            
            // Call Completion Handler
            completion?()
        }
        
    }
    
    func replaceCrossfadeAnimated(viewController fromViewController: UIViewController, with toViewController: UIViewController, completion: (() -> Void)? = nil) {
        
        fromViewController.willMove(toParent: nil)
        
        addChild(toViewController)
        
        transition(from: fromViewController, to: toViewController, duration: 0.66, options: [.transitionCrossDissolve], animations: {

        }) { (completed) in
            // Remove child view controller
            fromViewController.removeFromParent()
            
            // Notify child view controller
            toViewController.didMove(toParent: self)
            
            // Call Completion Handler
            completion?()
        }
        
    }
}

//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

open class RootViewController: UIViewController, ViewControllerContaining {
    
    // MARK: - Properties
    private var childViewController: UIViewController?
    
    open override var childForStatusBarHidden: UIViewController? {
        return childViewController
    }
    
    // MARK: - Methods
    func setChildViewController(_ viewController: UIViewController, animated: Bool = false, animationType: AnimationType = .crossfade, completion: (() -> Void)? = nil) {
        
        // Store current child view controller
        let currentViewController = self.childViewController
        
        // Update child view controller with new one
        self.childViewController = viewController
        
        // Transition
        if (!animated) || (currentViewController == nil) {
            replace(viewController: currentViewController, with: viewController)
            completion?()
        } else {
            switch animationType {
            case .crossfade:
                replaceCrossfadeAnimated(viewController: currentViewController!, with: viewController) {
                    completion?()
                }
            case .move:
                replaceAnimated(viewController: currentViewController!, with: viewController) {
                    completion?()
                }
            case .slide:
                replaceFromRightAnimated(viewController: currentViewController!, with: viewController) {
                    completion?()
                }
            }
            
        }
    }
    
    public func embed(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        
        
        // Store current child view controller
        let currentViewController = self.childViewController
        
        // Update child view controller with new one
        self.childViewController = viewController
        
        // Replace current view controller with new one
        replace(viewController: currentViewController, with: viewController)
        
        // Invoke completion handler
        completion?()
    }

}

// MARK: View Controller Life Cycle

extension RootViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RootViewController {
    enum AnimationType {
        case crossfade
        case move
        case slide
    }
}


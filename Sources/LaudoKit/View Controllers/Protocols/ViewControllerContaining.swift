//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

public protocol ViewControllerContaining {
    func embed(viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func extract(viewController: UIViewController)
}

extension ViewControllerContaining where Self: UIViewController {
    func embed(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        add(viewController)
        completion?()
    }
    
    public func extract(viewController: UIViewController) { }
}

//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 23.11.2020.
//

import UIKit

open class Coordinator: NSObject, UINavigationControllerDelegate {

    // MARK: - Properties

    public var didFinish: ((Coordinator) -> Void)?

    
    // MARK: -
    public var childCoordinators: [Coordinator] = []

    
    // MARK: - Methods

    open func start() {}

    
    // MARK: - UINavigationControllerDelegate
    open func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, willShow: viewController, animated: animated)
        }
    }
    
    open func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, didShow: viewController, animated: animated)
        }
    }
    
    
    // MARK: -
    public func pushCoordinator(_ coordinator: Coordinator, completion: ((Coordinator) -> Void)? = nil) {
        // Install Handler
        coordinator.didFinish = { [weak self] (coordinator) in
            self?.popCoordinator(coordinator)
            completion?(coordinator)
        }

        // Start Coordinator
        coordinator.start()

        // Append to Child Coordinators
        childCoordinators.append(coordinator)
    }

    public func popCoordinator(_ coordinator: Coordinator) {
        // Remove Coordinator From Child Coordinators
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }

}

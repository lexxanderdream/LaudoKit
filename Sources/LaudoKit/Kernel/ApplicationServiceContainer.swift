//
//  ApplicationServiceContainer.swift
//  Laudo
//
//  Created by Alexander Zhuchkov on 31.08.2020.
//

import Swinject

public protocol ApplicationServiceContainer {
    var container: Container { get }
    func resolve<Service>(_ serviceType: Service.Type) -> Service
    func resolve<Service>(_ serviceType: Service.Type, name: String?) -> Service
}

public extension ApplicationServiceContainer {
    func registerServices(providers: [ServiceProvider.Type]) {
        providers.forEach { (providerType) in
            let provider = providerType.init(container: container)
            print("Register service", providerType)
            provider.register()
        }
    }
    
    func resolve<Service>(_ serviceType: Service.Type) -> Service {
        return container.resolve(serviceType)!
    }
    
    func resolve<Service>(_ serviceType: Service.Type, name: String?) -> Service {
        return container.resolve(serviceType, name: name)!
    }
}


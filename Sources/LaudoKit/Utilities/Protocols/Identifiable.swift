//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

public protocol Identifiable {
    // Return a string representation of this class
    static var identifier: String { get }
}

public extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

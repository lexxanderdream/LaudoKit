//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 14.06.2020.
//


public protocol TableViewSectionType {
    associatedtype RowType
    
    var rows: [RowType] { get }
    var header: String? { get }
    var footer: String? { get }
}

public extension TableViewSectionType {
    var header: String? {
        return nil
    }
    
    var footer: String? {
        return nil
    }
}

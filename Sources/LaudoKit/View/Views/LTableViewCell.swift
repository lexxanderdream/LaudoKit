//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

open class LTableViewCell: UITableViewCell, Identifiable {
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    open func initialize() {
        
    }
    
    open func configure(with presentable: TableViewCellPresentable) {
        textLabel?.text = presentable.text
        detailTextLabel?.text = presentable.detailText
        accessoryType = presentable.accessoryType
        imageView?.image = presentable.image
    }
}



public protocol TableViewCellPresentable {
    var text: String? { get  }
    var detailText: String? { get }
    var image: UIImage? { get }
    var accessoryType: UITableViewCell.AccessoryType { get }
}


public extension TableViewCellPresentable {
    var detailText: String? {
        return nil
    }
    
    var image: UIImage? {
        return nil
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        return .none
    }
}

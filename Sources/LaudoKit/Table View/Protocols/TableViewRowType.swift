//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 14.06.2020.
//

import UIKit

public protocol TableViewRowType {
    // MARK: - Properties
    var reuseIdentifier: String { get }
    
    // MARK: - Methods
    func configureCell(_ cell: UITableViewCell)
}

public extension TableViewRowType {
    var reuseIdentifier: String {
        return String(describing: LTableViewCell.self)
    }
}

public extension TableViewRowType where Self: TableViewCellPresentable {
    func configureCell(_ cell: UITableViewCell) {
        (cell as? LTableViewCell)?.configure(with: self)
    }
}

//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

public extension UITableViewCell {
    enum SeparatorType {
        case none
        case full
        case insetted(CGFloat)
        case both(CGFloat)
    }
    
    @discardableResult
    func separator(_ type: SeparatorType) -> Self {
        let left: CGFloat = {
            switch type {
            case .none: return bounds.size.width
            case .insetted(let value): return value
            case .full: return 0
            case .both(let value): return value
            }
        }()
        
        let right: CGFloat = {
            switch type {
            case .both(let value): return value
            default: return 0
            }
        }()
        
        separatorInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
        
        return self
    }
}

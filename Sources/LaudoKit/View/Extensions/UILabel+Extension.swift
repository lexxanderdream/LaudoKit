//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

public extension UILabel {
    
    @discardableResult
    func foregroundColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func numberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func roundedFont() -> Self {
        // Rounded font
        if #available(iOS 13.0, *) {
            let size = self.font.pointSize
            let weight = self.font.weight
            
            if let descriptor = UIFont.systemFont(ofSize: size, weight: weight).fontDescriptor.withDesign(.rounded) {
                let font = UIFont(descriptor: descriptor, size: size)
                self.font = font
            }
        }
        
        return self
    }
}

//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 15.06.2020.
//


import UIKit

public extension UITextField {
    
    @discardableResult
    func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Self {
        self.borderStyle = borderStyle
        return self
    }
    
}

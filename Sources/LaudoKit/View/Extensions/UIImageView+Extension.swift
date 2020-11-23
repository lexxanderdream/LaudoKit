//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

public extension UIImageView {
    
    @discardableResult
    func contentMode(_ contentMode: UIImageView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    @discardableResult
    func foregroundColor(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }
}

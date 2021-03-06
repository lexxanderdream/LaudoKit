//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

public extension UIButton {
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.setImage(image, for: .normal)
        return self
    }
    
    @discardableResult
    func title(_ title: String?) -> Self {
        self.setTitle(title, for: .normal)
        return self
    }
    
    @discardableResult
    func attributedTitle(_ title: NSAttributedString?) -> Self {
        self.setAttributedTitle(title, for: .normal)
        return self
    }
    
    @discardableResult
    func foregroundColor(_ color: UIColor) -> Self {
        self.setTitleColor(color, for: .normal)
        self.tintColor = color
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    func insets(forContentPadding contentPadding: UIEdgeInsets, imageTitlePadding: CGFloat) -> Self {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
        
        return self
    }
}

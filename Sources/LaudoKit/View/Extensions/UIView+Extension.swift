//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

public extension UIView {
        
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func border(_ color: UIColor, width: CGFloat? = nil) -> Self {
        let widthInPoints = width == nil ? 1 / UIScreen.main.scale : width!
        layer.borderColor = color.cgColor
        layer.borderWidth = widthInPoints
        
        return self
    }
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
        
        return self
    }
    
    @discardableResult
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) -> Self {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        return self
    }
    
    @discardableResult
    func shadow(color: UIColor = .gray, opacity: Float = 0.4, radius: CGFloat = 12.0, offset: CGSize = .zero) -> Self {
        self.layer.masksToBounds = false
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        
        return self
    }
    
    @discardableResult
    func hidden(_ isHidden: Bool = true) -> Self {
        self.isHidden = isHidden
        
        return self
    }
    
    @discardableResult
    func heightEqualWidth(multiplier: CGFloat = 1.0) -> Self {
        
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: multiplier, constant: 0)
        constraint.isActive = true
        return self
    }

}

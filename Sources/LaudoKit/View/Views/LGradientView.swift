//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 25.07.2020.
//

import UIKit

open class LGradientView: UIView {
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    
    // MARK: - Initialization
    @available(*, unavailable)
    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }
    
    public init() {
        super.init(frame: .zero)

        self.initialize()
    }
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

public extension LGradientView {
    
    @discardableResult
    func colors(_ colors: [UIColor]) -> Self {
        let gradientLayer = layer as! CAGradientLayer
        let cgColors = colors.map { $0.cgColor }
        gradientLayer.colors = cgColors
        
        return self
    }
    
    @discardableResult
    func direction(startPoint: CGPoint, endPoint: CGPoint) -> Self {
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        return self
    }
    
    @discardableResult
    func locations(_ locations: [NSNumber]?) -> Self {
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.locations = locations
        
        return self
    }
    
    @discardableResult
    func gradient(_ gradient: CAGradientLayer) -> Self {
        let gradientLayer = layer as! CAGradientLayer
        
        gradientLayer.colors = gradient.colors
        gradientLayer.startPoint = gradient.startPoint
        gradientLayer.endPoint = gradient.endPoint
        gradientLayer.locations = gradient.locations
        
        return self
    }
    
}

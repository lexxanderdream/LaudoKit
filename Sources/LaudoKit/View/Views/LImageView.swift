//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

open class LImageView: UIImageView {
    
    @available(*, unavailable)
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public init(image: UIImage?) {
        super.init(image: image)
        
        self.initialize()
    }
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        clipsToBounds = false
    }
}

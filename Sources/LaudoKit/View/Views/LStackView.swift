//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

@available(iOS 12.0, *)
open class LStackView: UIStackView {
    
    // MARK: - Initialization
    @available(*, unavailable)
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    @available(*, unavailable)
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(frame: .zero)
        
        self.initialize()
    }
    
    // MARK: - Methods
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


// MARK: - Vertical Stack View
@available(iOS 12.0, *)
open class LVerticalStackView: LStackView {
    
    // MARK: - Overrides
    open override func initialize() {
        super.initialize()
        
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .fill
    }
}


// MARK: - Horizontal Stack View
@available(iOS 12.0, *)
open class LHorizontalStackView: LStackView {
    
    // MARK: - Overrides
    open override func initialize() {
        super.initialize()
        
        self.axis = .horizontal
        self.distribution = .fill
        self.alignment = .fill
    }
}

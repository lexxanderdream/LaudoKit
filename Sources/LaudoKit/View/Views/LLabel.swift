//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

open class LLabel: UILabel {
    
    // MARK: - Initialization
    @available(*, unavailable)
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(frame: .zero)
        self.initialize()
    }
   
    public init(text: String?, font: UIFont?) {
        super.init(frame: .zero)
        
        self.text = text
        self.font = font

        self.initialize()
    }
    
    convenience public init(text: String) {
        self.init(text: text, font: nil)
    }
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

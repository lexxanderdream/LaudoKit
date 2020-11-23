//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 04.08.2020.
//

import UIKit

open class LSlider: UISlider {
    
    // MARK: - Properties
    private var valueChangeHandler: ((LSlider) -> Void)?
    
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
    
        self.initialize()
    }
    
    convenience public init(text: String) {
        self.init(text: text, font: nil)
    }
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(self.valueDidChange(_:)), for: .valueChanged)
    }
    
    // MARK: - Handlers
    @objc func valueDidChange(_ sender: LSlider) {
        self.valueChangeHandler?(sender)
    }
    
    // MARK: - Methods
    @discardableResult
    public func onValueChange(_ handler: @escaping ((LSlider) -> Void)) -> Self {
        self.valueChangeHandler = handler
        return self
    }
}

//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

open class LButton: UIButton {
    
    // MARK: - Properties
    private var touchHandler: ((LButton) -> Void)?
    
    // MARK: - Initialization
    @available(*, unavailable)
    override init(frame: CGRect) {
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
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(self.touchAction(_:)), for: .touchUpInside)
    }
    
    // MARK: - Handlers
    @objc func touchAction(_ sender: LButton) {
        self.touchHandler?(sender)
    }
    
    // MARK: - Methods
    @discardableResult
    public func onTouch(_ handler: @escaping ((LButton) -> Void)) -> Self {
        self.touchHandler = handler
        return self
    }
}


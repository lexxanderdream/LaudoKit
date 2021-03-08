//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 21.07.2020.
//

import UIKit

open class LControl: UIControl {
    
    // MARK: - Properties
    private var touchHandler: ((LControl) -> Void)?
    
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
        self.addTarget(self, action: #selector(self.touchAction(_:)), for: .touchUpInside)
    }
    
    // MARK: - Handlers
    @objc func touchAction(_ sender: LControl) {
        self.touchHandler?(sender)
    }
    
    // MARK: - Methods
    @discardableResult
    public func onTouch(_ handler: @escaping ((LControl) -> Void)) -> Self {
        self.touchHandler = handler
        return self
    }
}

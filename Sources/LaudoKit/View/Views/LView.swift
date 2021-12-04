//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

open class LView: UIView {
    
    // MARK: - Properties
    private var touchHandler: ((LView) -> Void)?
    
    
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
    
    
    // MARK: - Handlers
    @objc func touchAction(_ sender: LView) {
        self.touchHandler?(sender)
    }

    
    // MARK: - Methods
    @discardableResult
    open func onTouch(_ handler: @escaping ((LView) -> Void)) -> Self {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchAction(_:)))
        addGestureRecognizer(tapGesture)
        self.touchHandler = handler
        
        return self
    }
}

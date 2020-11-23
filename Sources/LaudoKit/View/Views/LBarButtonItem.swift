//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

open class LBarButtonItem: UIBarButtonItem {
    
    // MARK: - Properties
    private var touchHandler: ((LBarButtonItem) -> Void)?
    
    // MARK: - Initialization
    override public init() {
        super.init()
        
        self.initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    public init(image: UIImage) {
        super.init()
        
        self.image = image
        self.style = .plain
        
        self.initialize()
    }
    
    public init(title: String, style: UIBarButtonItem.Style = .done) {
        super.init()
        
        self.style = style
        self.title = title
        
        self.initialize()
    }
    
    open func initialize() {
        self.target = self
        self.action = #selector(self.touchAction(_:))
    }
    
    
    // MARK: - Handlers
    @objc func touchAction(_ sender: LBarButtonItem) {
        self.touchHandler?(sender)
    }
    
    // MARK: - Public API
    @discardableResult
    public func onTouch(_ handler: @escaping ((LBarButtonItem) -> Void)) -> Self {
        self.touchHandler = handler
        return self
    }
}

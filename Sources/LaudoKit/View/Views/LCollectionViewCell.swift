//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

open class LCollectionViewCell: UICollectionViewCell, Identifiable {
    
    // MARK: - Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
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
        
    }
    
}

//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

open class LScrollView: UIScrollView {

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
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


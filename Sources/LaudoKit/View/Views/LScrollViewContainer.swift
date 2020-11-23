//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.08.2020.
//

import UIKit

@available(iOS 13.0, *)
open class LScrollViewContainer: LView {
    
    // MARK: - Properties
    public let scrollView = LScrollView()
    public let contentView = LView()
    
    // MARK: - Overrides
    open override func initialize() {
        
        // Subviews
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // Layout
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1)
        ])
    }
}

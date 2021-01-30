//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 03.07.2020.
//
import UIKit

@available(iOS 13.0, *)
open class LBorderView: LView {
    
    // MARK: - Properties
    private let width: CGFloat
    
    // MARK: -
    var color: UIColor {
        set {
            backgroundColor = newValue
        }
        get {
            return backgroundColor!
        }
    }
    
    // MARK: - Initialization
    public init(color: UIColor = .opaqueSeparator, width: CGFloat? = nil) {
        self.width = width ?? 1 / UIScreen.main.scale
        super.init()
        
        self.color = color
    }
    
    public func place(in view: UIView, position: Position) {
        view.addSubview(self)
        
        // Setup Width
        switch position {
        case .top, .bottom:
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: width),
                self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        case .left, .right:
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: width),
                self.topAnchor.constraint(equalTo: view.topAnchor),
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        // Setup Constraint
        switch position {
        case .top:
            self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        case .bottom:
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .left:
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        case .right:
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
    }
}

@available(iOS 13.0, *)
public extension LBorderView {
    enum Position {
        case top
        case left
        case bottom
        case right
    }
}

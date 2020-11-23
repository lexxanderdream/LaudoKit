//
//  Paddable.swift
//  
//
//  Created by Alexander Zhuchkov on 28.06.2020.
//

import UIKit

public protocol Paddable {
    var verticalPadding: CGFloat { get set }
    var horizontalPadding: CGFloat { get set }
}

public extension Paddable {
    func pad(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width + horizontalPadding, height: size.height + verticalPadding)
    }
}


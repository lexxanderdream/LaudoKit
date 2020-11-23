//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.08.2020.
//

import UIKit

open class LAttributedString {
    
    public static func underline(text: String, font: UIFont, color: UIColor) -> NSAttributedString {
        let string = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.underlineStyle: 1.0
        ])
        
        return string
    }
}

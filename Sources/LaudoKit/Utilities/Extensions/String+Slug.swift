//
//  String+Slug.swift
//  Caveman
//
//  Created by Alexander Zhuchkov on 22.01.2020.
//  Copyright © 2020 Alexander Zhuchkov. All rights reserved.
//

import Foundation

extension String {
    private static let slugSafeCharacters = CharacterSet(charactersIn: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-")

    public func convertedToSlug() -> String? {
        if let latin = self.applyingTransform(StringTransform("Any-Latin; Latin-ASCII; Lower;"), reverse: false) {
            let urlComponents = latin.components(separatedBy: String.slugSafeCharacters.inverted)
            let result = urlComponents.filter { $0 != "" }.joined(separator: "-")

            if result.count > 0 {
                return result
            }
        }

        return nil
    }
    
    public func removeInvalidCharacters() -> String {
        var invalidCharacters = CharacterSet(charactersIn: ":/")
        
        invalidCharacters.formUnion(.newlines)
        invalidCharacters.formUnion(.illegalCharacters)
        invalidCharacters.formUnion(.controlCharacters)

        let filename = self
            .components(separatedBy: invalidCharacters)
            .joined(separator: "_")
        
        return filename
    }
}

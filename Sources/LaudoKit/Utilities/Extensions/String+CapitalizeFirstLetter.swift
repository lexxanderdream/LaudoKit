//
//  String+CapitalizeFirstLetter.swift
//  Caveman
//
//  Created by Alexander Zhuchkov on 18.02.2020.
//  Copyright © 2020 Alexander Zhuchkov. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

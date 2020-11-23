//
//  String+Subscript.swift
//  Caveman
//
//  Created by Alexander Zhuchkov on 20.01.2020.
//  Copyright © 2020 Alexander Zhuchkov. All rights reserved.
//

import Foundation

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

}



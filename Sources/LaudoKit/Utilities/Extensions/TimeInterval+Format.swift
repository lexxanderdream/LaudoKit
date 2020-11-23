//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import Foundation

extension TimeInterval {
    
    /// Converts a `TimeInterval` into a MM:SS formatted string.
    ///
    /// - Returns: A `String` representing the MM:SS formatted representation of the time interval.
    public func toMMSS() -> String {

        if self.isNaN {
            return String(format: "%02d:%02d", 0, 0)
        }
      
        let ts = Int(self)
        let s = ts % 60
        let m: Int = (ts / 60) % 60
        let h: Int = ts / 3600
     
        if h > 0 {
            return String(format: "%02d:%02d:%02d", h, m, s)
        } else {
            return String(format: "%02d:%02d", m, s)
        }
    }
    
}

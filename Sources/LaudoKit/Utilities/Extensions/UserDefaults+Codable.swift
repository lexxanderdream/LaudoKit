//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import Foundation

public extension UserDefaults {
    func store<T: Codable>(_ value: T, forKey key: String, encoder: JSONEncoder = JSONEncoder()) {
        if let data: Data = try? encoder.encode(value) {
            set(data, forKey: key)
        }
    }
    
    func fetch<T>(forKey key: String, type: T.Type, decoder: JSONDecoder = JSONDecoder()) -> T? where T: Decodable {
        if let data = data(forKey: key) {
            return try? decoder.decode(type, from: data) as T
        }
        
        return nil
    }
}

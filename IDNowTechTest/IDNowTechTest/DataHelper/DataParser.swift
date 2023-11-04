//
//  Data.swift
//  IDNowTechTest
//
//  Created by user on 01/11/2023.
//

import Foundation

struct InfoPlistParser {
    
    static func getKey(forKey key : String)->String{
        
        guard let value = Bundle.main.infoDictionary?[key] as? String else {
            fatalError("can not find value for key \(key) info Plist")
        }
        return value
    }
}

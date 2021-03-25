//
//  Bundle.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import Foundation

extension Bundle{
    
    func decode <T : Codable>(_ file: String) -> T{
    // 1. Locate the JSON file in the app Bundle

        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("unable to trace local json location")
        }
        
    // 2. Create a property
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("unable to create data")
        }
    
    // 3. Create a Json decoder
        
        let decoder = JSONDecoder()
    
    // 4. Decode the data and collect the information with a new property
        
        guard let finalValue = try? decoder.decode(T.self, from: data) else{
            fatalError("Unable to decode")
        }
    
    // 5. Return the ready-to-use use DATA
    return finalValue
}
}

//
//  Animals.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import Foundation

struct Animals: Codable, Identifiable {
    
    var id : String
    var name : String
    var headline : String
    var description : String
    var link : String
    var image : String
    var gallery : [String]
    var fact : [String]
}

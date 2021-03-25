//
//  VideoModel.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 03/01/2021.
//

import Foundation


struct VideoModel: Codable, Identifiable{
    
    var id : String
    var name : String
    var headline : String
    
    var thumbail : String {
        "video-\(id)"
    }
    
}

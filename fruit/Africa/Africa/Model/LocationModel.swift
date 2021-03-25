//
//  LocationModel.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 04/01/2021.
//

import Foundation
import MapKit


struct parkLocationModel: Codable, Identifiable {
    
   var id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    
    var coordinates : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

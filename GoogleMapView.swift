//
//  GoogleMapView.swift
//  Football Fanatic
//
//  Created by Perception on 16/03/2023.
//

import SwiftUI
import UIKit
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {

    
   
    /// Creates a `UIView` instance to be presented.
    func makeUIView(context: Self.Context) -> GMSMapView {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 51.4064, longitude: 0.2407, zoom: 9)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)

        return mapView
    }

    /// Updates the presented `UIView` (and coordinator) to the latest
    /// configuration.
    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
        // Creates a marker in the center of the map.
        
        LocationModel.londonLocation.forEach { loca in
            let marker : GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: loca.lat, longitude: loca.long)
            marker.title = loca.location
            marker.snippet = loca.postalCode
            marker.icon = UIImage(named: "pinMap")
            marker.map = mapView
        
        }
       

        
    }


}

struct GoogleMapView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapView()
    }
}

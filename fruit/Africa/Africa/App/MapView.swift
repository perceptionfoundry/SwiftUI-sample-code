//
//  MapView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
   
    
    @State private var region : MKCoordinateRegion = {
        
    var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapSpan =  MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60)
        
    var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapSpan)
        
        return mapRegion
    }()
    
    let animalLocation : [parkLocationModel] = Bundle.main.decode("locations.json")
    
    
    var body: some View {
        
        
        Map(coordinateRegion: $region, annotationItems: animalLocation, annotationContent: { item in
             // old style
//            MapPin(coordinate: item.coordinates, tint: .blue)
            
            //new style
//            MapMarker(coordinate: item.coordinates, tint: .accentColor)
            
            // Custom:
            MapAnnotation(coordinate: item.coordinates){
                
                Map_Marker(location: item)
            }
            
        })
        .overlay(
            HStack {
                Image("compass")
                .resizable()
                .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                
                
                
                VStack(alignment: .leading, spacing: 3){
                    HStack {
                        VStack{
                            HStack {
                                Text("Latitude:")
                                .foregroundColor(.accentColor)
                                .fontWeight(.semibold)
                                Spacer()
                                Text("\(region.center.latitude)")
                              

                            }
                            HStack {
                                Text("Longitude:")
                                    .foregroundColor(.accentColor)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(
                                    "\(region.center.latitude)")
                            } //:HStack
//
                        }// VStack
                    }//:HStack
                    Divider()
                }
               
            }// HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .opacity(0.6)
                    .cornerRadius(10)
            )
            .padding()
            ,alignment: .top
        )

    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 11 Pro")
    }
}

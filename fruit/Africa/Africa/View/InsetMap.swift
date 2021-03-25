//
//  MapView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI
import MapKit

struct InsetMap: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
    
       
        Map(coordinateRegion: $region)
          
            .overlay(
                NavigationLink(destination:MapView()) {
                    HStack{
                Image(systemName: "mappin.circle")
                    .imageScale(.large)
                    .foregroundColor(.white)
                        
                Text("Location")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    }//HStack End
                    .padding(.vertical,10)
                    .padding(.horizontal, 10)
                    .background(
                        Color.black
                        .opacity(0.3)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        )
                } //:Navigation End
                , alignment:.topTrailing
            )
            .frame(height:256)
            .cornerRadius(12)
    }
}

struct InsetMap_Previews: PreviewProvider {
    static var previews: some View {
        InsetMap()
            .previewLayout(.sizeThatFits)
            
        
            
    }
}

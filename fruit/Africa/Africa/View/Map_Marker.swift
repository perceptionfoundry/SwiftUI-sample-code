//
//  MapMarker.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 04/01/2021.
//

import SwiftUI

struct Map_Marker: View {
    
    
    var location :  parkLocationModel
    @State var isAnimation = true
    @State var animation :Double = 0.0
    
    var body: some View {
      
        ZStack {
            
            Circle()
                .fill(Color.accentColor)
                .frame(width:48,height: 48, alignment:  .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width:45,height: 45)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(0.6)
            
            Image(location.image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                
        }// ZStack
        .onAppear(perform: {
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)){
            
                animation = 1
            }
        })
        
    }
}

struct MapMarker_Previews: PreviewProvider {
    
   static let locations : [parkLocationModel] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        
        Map_Marker(location: locations[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI

struct InsetGalleryView: View {
   
    var animals : Animals
    
    var body: some View {
       
        
        ScrollView(.horizontal, showsIndicators: false){
            
        
        HStack(alignment:.center, spacing: 16) {
           
            ForEach(animals.gallery, id: \.self) { animal in
                Image(animal)
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                    .cornerRadius(12)
            }//: LOOP
        }
    }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    
    static let animal : [Animals] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        
        InsetGalleryView(animals: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

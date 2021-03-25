//
//  BigGridImageView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 05/01/2021.
//

import SwiftUI

struct BigGridImageView: View {
    
    var animal : Animals
    
    var body: some View {
        
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(Rectangle())
            .cornerRadius(12)
            
        
            
            
        

    }
}

struct BigGridImageView_Previews: PreviewProvider {
   
     static var animals : [Animals] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        BigGridImageView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

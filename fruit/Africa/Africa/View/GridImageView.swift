//
//  GridImageView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 05/01/2021.
//

import SwiftUI

struct GridImageView: View {
    
    var animal : Animals
    
    
    var body: some View {
        
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(
            Circle()
            .stroke(Color.white, lineWidth: 2)
                        )
            
            
        

    }
}

struct GridImageView_Previews: PreviewProvider {
    
    static var animals : [Animals] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        GridImageView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

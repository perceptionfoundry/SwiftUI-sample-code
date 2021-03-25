//
//  HeaderView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI

struct HeaderView: View {
    
    
    var headingImage : String
    var headingTitle : String
    var body: some View {
        
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingTitle)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(headingImage: "photo.on.rectangle", headingTitle: "Heading Title")
            .previewLayout(.sizeThatFits)
            
    }
}

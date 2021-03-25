//
//  InsetLink.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 03/01/2021.
//

import SwiftUI

struct InsetLink: View {
    
    let animals : Animals
    
    var body: some View {
        
        GroupBox{
            
            HStack{
                
                Image(systemName: "globe")
                Text("wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animals.name, destination: URL(string: animals.link)!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct InsetLink_Previews: PreviewProvider {
    
    static var animals : [Animals] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetLink(animals: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

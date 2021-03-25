//
//  InsetFact.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI

struct InsetFact: View {
    var animal : Animals
    var body: some View {
       
     
        
        GroupBox{
            TabView{
                
                ForEach(animal.fact,id: \.self) { fact in
                    Text(fact)
                        .multilineTextAlignment(.center)
                }
                
            }
            .tabViewStyle(PageTabViewStyle())
            .frame( minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
       
    }
}

struct InsetFact_Previews: PreviewProvider {
    static var animals : [Animals] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFact(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

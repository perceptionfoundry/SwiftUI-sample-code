//
//  FactView.swift
//  Avocado
//
//  Created by Syed ShahRukh Haider on 13/01/2021.
//

import SwiftUI

struct FactView: View {
    
    let fact : Fact
    
    var body: some View {
        
        ZStack {
            Text(fact.content)
                .padding(.leading, 55)
                .padding(.trailing,10)
                .padding(.vertical, 3)
                .frame(width: 300, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(LinearGradient(gradient: Gradient(colors: [Color("ColorGreenLight"), Color("ColorGreenMedium")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .foregroundColor(.white)
                .font(.footnote)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
                .lineLimit(6)
            
            Image(fact.image)
                .resizable()
                .frame(width: 66, height: 66, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                .background(
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 74, height: 74, alignment: .center)
                )
                
                .background(
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorGreenLight"), Color("ColorGreenMedium")]), startPoint: .trailing, endPoint: .leading))
                        .frame(width: 82, height: 82, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                )
                .background(
                    Circle()
                        .foregroundColor(Color("ColorAppearanceAdaptive"))
                        .frame(width: 90, height: 90, alignment: .center)
                )
                .offset(x: -150)
            
            
        }
    }
}

struct FactView_Previews: PreviewProvider {
    
    static var factsInfo : [Fact] = FactData
    
    static var previews: some View {
        FactView(fact: factsInfo[3])
            .previewLayout(.fixed(width: 400, height: 220))
    }
}

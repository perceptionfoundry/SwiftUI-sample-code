//
//  FruitRowView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 23/12/2020.
//

import SwiftUI

struct FruitRowView: View {
    
    
    // PROPERTIES
    var fruit : Fruit
    
    
    //BODY
    var body: some View {
        
        HStack{
            Image(fruit.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 8, x: 2, y: 2)
                .background(
                    LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom)
                        .cornerRadius(8.0)
                )
            
            VStack(alignment: .leading, spacing: 5){
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.heavy)
                Text(fruit.headline)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
                   
            }
        } //: H-Stack End
    }
}

// PREVIEW
struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitRowView(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

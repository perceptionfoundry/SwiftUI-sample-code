//
//  AnimalListView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI



struct AnimalListView: View {
    
    var animal : Animals
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                
                Text(animal.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                
            }
            
        }//: HStack end
    }
}

struct AnimalListView_Previews: PreviewProvider {
  
    static let animal : [Animals] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
      
        AnimalListView(animal: animal[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

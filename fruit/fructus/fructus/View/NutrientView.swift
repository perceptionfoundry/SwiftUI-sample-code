//
//  NutrientView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 25/12/2020.
//

import SwiftUI

struct NutrientView: View {
    
    //PROPERTIES
    var fruit : Fruit
    var nutrients = ["Energy", "Sugar", "Fat", "Protein", "Vitamin", "Mineral"]
    // BODY
    var body: some View {
        
        GroupBox(){
            DisclosureGroup("Nutrientional Value per 100g") {
              
                ForEach(0..<nutrients.count, id: \.self){ item in
                    Divider()
                    HStack{
                        //Nutrient Title
                        Group{
                            Image(systemName: "info.circle")
                            Text(nutrients[item])

                        }
                        .foregroundColor(fruit.gradientColors.last)
                        .font(Font.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        //Nutrient Detail
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                            
                        
                    }//: HStack End
                }//: Loop
            }//: Disclosure End
        }//: GroupBox End
    }
}



//PREVIEW
struct NutrientView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}

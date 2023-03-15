//
//  DishesView.swift
//  Avocado
//
//  Created by Syed ShahRukh Haider on 11/01/2021.
//

import SwiftUI

struct DishesView: View {
    
    var dishTitle = ["toasts", "tacos", "salads", "spreads", "guacamole", "sandwiches","soup", "smoothies"]
    
    var body: some View {
        
    
        
        HStack {
            VStack {
                ForEach(0 ..< 4) { item in
                    DishTabView_L(title: dishTitle[item])
                    Divider()
                        .border(Color.blue, width: 10)
                }// Loop
            }
            
            VStack{
                HStack{
                    Divider()
                }
         
            
            Image(systemName: "heart.circle")
                .font(.title)
                .imageScale(.large)

          
                HStack{
                    Divider()
                }
            }
            VStack {
                ForEach(4 ..< 8) { item in
                    DishTabView_R(title: dishTitle[item])
                    Divider()
                        .border(Color.blue, width: 10)
                }// Loop
            }// V-Stack

        }// H-Stack
        .font(.system(.callout,design: .serif))
        .padding(.horizontal)
        .foregroundColor(.gray)
        .frame(maxHeight: 220)
        
    }
}


struct DishTabView_L: View {
   
    var title = ""
    var body: some View {
     
        HStack {
            Image("icon-\(title)")
                .resizable()
                .scaledToFit()
                .frame(width: 42 , height: 42)
            Spacer()
            Text(title.capitalized)
                .font(.system(size: 14, weight: .bold, design: .serif))
                .foregroundColor(.gray)
        }
    }
    
}
    
struct DishTabView_R: View {
   
    var title = ""
    var body: some View {
     
        HStack {
            
            
            Text(title.capitalized)
                .font(.system(size: 14, weight: .bold, design: .serif))
                .foregroundColor(.gray)
            Spacer()
            Image("icon-\(title)")
                .resizable()
                .scaledToFit()
                .frame(width: 42 , height: 42)
           
        }
    }
    
}



struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
            .previewLayout(.fixed(width: 414, height: 280))
    }
}

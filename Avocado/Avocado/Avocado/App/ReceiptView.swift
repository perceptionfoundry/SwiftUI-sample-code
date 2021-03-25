//
//  ReceiptView.swift
//  Avocado
//
//  Created by Syed ShahRukh Haider on 07/01/2021.
//

import SwiftUI

struct ReceiptView: View {
    
    var headerInfo : [Header] = HeaderData
    var factsInfo : [Fact] = FactData
    var receiptsList = recipesData
    var body: some View {
    
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/){
            
            VStack(alignment: .center, spacing: 20){
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack (alignment: .center, spacing: 0){
                    ForEach(headerInfo){ item in
                        HeaderView(headerContent: item)
                    }
                }
            })
            
            Text("Avocado Dishes")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .modifier(TitleModifier())
                
           
            DishesView()
                .frame(maxHeight: 640)
                
                Text("Avocado Dishes")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack (alignment: .top, spacing: 60){
                        ForEach(factsInfo){ item in
                            FactView(fact: item)
                            
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                })
                
                
            VStack{
               
                
                VStack {
                    Text("All About Avocado")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                      
                    
                    Text("Everything you wanted to know about avocados but were too afraid to ask.")
                      .font(.system(.body, design: .serif))
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color.gray)
                }//VStack
                .frame(maxWidth : 640)
                .padding()
//                .padding(.horizontal, 85)
            }//VStack
                
                Text("Avocado Receipt")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .modifier(TitleModifier())
                
                ForEach(receiptsList){ item in
                   
                    ReceiptCellView(receipt: item)
                        
                }
                
                    
                    
        }
            
        }//ScrollView
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .padding(0)
    }
}

struct TitleModifier: ViewModifier {
    
    func body(content : Content) -> some View {
        content
        .font(.system(.title, design:.serif))
        .foregroundColor(Color("ColorGreenAdaptive"))
        .padding(8)
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView()
            
    }
}

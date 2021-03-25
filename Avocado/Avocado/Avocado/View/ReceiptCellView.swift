//
//  ReceiptView.swift
//  Avocado
//
//  Created by Syed ShahRukh Haider on 14/01/2021.
//

import SwiftUI

struct ReceiptCellView: View {
    
   var receipt : Recipe
    @State private var isModal = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Image(receipt.image)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 300, alignment: .center)
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName:"bookmark")
                                .foregroundColor(.white)
                                .imageScale(.large)
                                .shadow(color: Color("ColorBlackTransparetLight"), radius: 2, x: 0, y: 0)
                                .padding(.trailing, 20)
                                .padding(.top, 22)
                            Spacer()
                        }
                    }
                )
            
            VStack(alignment: .leading, spacing: 12) {
                // TITLE
                Text(receipt.title)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .font(.system(size: 20, weight: .bold, design: .serif))
                    .padding(.leading,10)
                    .lineLimit(1)
                
                
                
                // HEADLINE
                    
                    Text(receipt.headline)
                        .font(.system(.body, design: .serif))
                        .foregroundColor(.gray)
                        .italic()
                
                //STAR
                
                HStack {
                    ForEach(1 ... (receipt.rating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.body)
                            .foregroundColor(.yellow)
                    }
                }// H-Stack
                
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing:12){
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing:2){
                      Image(systemName: "person.2")
                        Text("Serve: \(receipt.serves)")
                    }
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing:2){
                      Image(systemName: "clock")
                        Text("Prep: \(receipt.preparation)")
                    }
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing:2){
                      Image(systemName: "flame")
                        Text("Cooking: \(receipt.cooking)")
                    }
                }
                .font(.footnote)
                .foregroundColor(.gray)
                    
            }
            .padding()
            .padding(.bottom,12)
            
        
            
                
        }// V-Stack
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
            isModal = true
        })
        .sheet(isPresented: $isModal, content: {
            RecipeDetailView(recipe: receipt)
        })

    }
    
    
}

struct ReceiptCellView_Previews: PreviewProvider {
    
    static var receiptsList = recipesData
    
    static var previews: some View {
        ReceiptCellView(receipt: receiptsList[3])
            .previewLayout(.sizeThatFits)
    }
}

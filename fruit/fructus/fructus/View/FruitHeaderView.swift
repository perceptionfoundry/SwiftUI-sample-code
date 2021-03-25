//
//  FruitHeaderView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 24/12/2020.
//

import SwiftUI

struct FruitHeaderView: View {
    
    
    //Mark: PROPERTIES
    var fruit : Fruit
    @State private var isAnimation = false
    //MARK: BODY
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color( red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .padding(.horizontal, 20)
                .scaleEffect(isAnimation ? 1 : 0.6)
        } // : Z-Stack End
        .frame(height: 440)
        .onAppear(){
            withAnimation(.easeInOut(duration: 0.5)){
                isAnimation = true
            }
        }
    }
}


//MARK: PREVIEW
struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData.first!)
            .previewLayout(.fixed(width: 375, height: 440))
    }
}

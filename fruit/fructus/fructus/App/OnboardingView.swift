//
//  OnboardingView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 22/12/2020.
//

import SwiftUI

struct OnboardingView: View {
    
    
    // PROPERTIES
    var fruits : [Fruit] = fruitsData
    
    //BODY
    
    var body: some View {
        
        TabView{
            
            ForEach(fruits[0...5]){item in
                
                FruitCardView(fruit: item)
            }//: LOOP
           
        }//: TABVIEW
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
        
       
    }
}

// PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewDevice("iPhone 11 Pro")
    }
}

//
//  FruitDetailView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 24/12/2020.
//

import SwiftUI






struct FruitDetailView: View {
    
    // Mark: PROPERTIES

    var fruit : Fruit

    // Mark: Body
    var body: some View {
        
        // TITLE
        ZStack {
            NavigationView{
                
                ScrollView{
                    
                    VStack(alignment: .center, spacing: 20){
                        
                        // Header View
                        FruitHeaderView(fruit: fruit)
                        
                        
                        VStack(alignment: .center, spacing: 20){
                        
                        //Title
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors.last)
                        
                        //HEADLINE
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        //NUTRIENT
                        NutrientView(fruit: fruit)
                            .padding(.horizontal, 10)
                        // SUBHEADLINE
                        Text("Learning more about \(fruit.title)")
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors.last)
                        // DESCRIPTION
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 10)
                        
                        //LINK
                            SourceLinkView()
                                .padding(.vertical ,10)
                                .padding(.horizontal, 20)
                        }  //: V-Stack ()
                        .padding(.horizontal, 10)
                        .frame(maxWidth: 640, alignment: .center)
                    }//: V-Stack (Header)
                    .navigationBarTitle(fruit.title, displayMode: .inline)
                    .navigationBarHidden(true)
                }//: Scroll View End
                .edgesIgnoringSafeArea(.top)
       
            }//: Navigation End
            .navigationViewStyle(StackNavigationViewStyle())
        }// : Z-Stack
      
    }
}


//Mark: PREVIEW
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
            .previewDevice("iPhone 11 Pro")
    }
}

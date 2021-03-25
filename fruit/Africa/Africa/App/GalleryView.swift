//
//  GalleryView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI

struct GalleryView: View {

    // PROPERTIES:
    
    let animals : [Animals] = Bundle.main.decode("animals.json")
    @State var selectedImage : String = "lion"
    
    var haptic = UIImpactFeedbackGenerator()
    //Simple Grid
//    var gridLayout  = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    
    // Static Array
//    var gridLayout = Array(repeating: GridItem(.flexible()), count: 3)

    
    //Dynamic Array
    @State var gridLayout = [GridItem(.flexible())]
    @State var gridCount: Double = 3.0
    
    func gridSwitch(){
        
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridCount))
    }


    var body: some View {
        ScrollView{
            
            VStack(alignment: .center, spacing: 20) {
                
                
                // Image
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 5))
                
                
                // Slider
                Slider(value: $gridCount, in: 2...4, step: 1)
                    .padding()
                    .onChange(of: gridCount, perform: { value in
                        
                        gridCount = value
                        gridSwitch()
                    })
            
                    
                    
                    
            // GRID
            LazyVGrid(columns: gridLayout, content: {
                
                    ForEach(animals) { item in
                        GridImageView(animal: item)
                            .onTapGesture(perform: {
                                selectedImage = item.image
                                haptic.impactOccurred()
                            })
                            
                        
                    }
                    .animation(.easeIn)
                    
                
                
            })// Grid
            .onAppear(perform: {
                gridSwitch()
            })
            }// VStack
            .padding()
        }// Scroll
        .frame(maxWidth: .infinity , maxHeight:.infinity)
        .background(
        MotionAnimationView()
        )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

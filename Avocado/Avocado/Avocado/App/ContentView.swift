//
//  ContentView.swift
//  Avocado
//
//  Created by Syed ShahRukh Haider on 07/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    //MARKS: Properties
    @State private var isAnimating  = false
    
    var body: some View {
       
        VStack{
            Spacer()
            Image("avocado")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 4)
                .scaleEffect(isAnimating ? 1 : 0.9)
                .opacity(isAnimating ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            
            VStack{
                Text("Avocado".uppercased())
                .font(.system(size: 42, weight: .bold, design: .serif))
                .padding()
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 4)
                .foregroundColor(.white)
            
            Text("Creamy, green, and full of nutrients! Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!")
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color("ColorGreenLight"))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .padding(.horizontal)
            }
            .padding()
            Spacer()
        }// VStack
        .background(
        Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            isAnimating.toggle()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.colorScheme,.dark)
    }
}

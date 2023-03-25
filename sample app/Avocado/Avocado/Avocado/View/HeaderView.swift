//
//  HeaderView.swift
//  Avocado
//
//  Created by Syed ShahRukh Haider on 07/01/2021.
//

import SwiftUI

struct HeaderView: View {
    
    @State private var isAnimating = false
    
    var headerContent : Header
    
    var slideInAnimation: Animation{
        Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
            .speed(1)
            .delay(0.24)
    }
    var body: some View {
        
        ZStack{
            Image(headerContent.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
 
         
            HStack(alignment:.top, spacing: 0){
                    
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width:4)
                
                VStack(alignment: .leading){
                        
                    Text(headerContent.headline)
                    .font(.system(.title, design: .serif))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding(.horizontal, 0)
                    .shadow(radius: 3)
                
                    Text(headerContent.subheadline)
                    .font(.system(.footnote, design: .serif))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                   
                    }
                
                    .padding(.vertical, 0)
                    .padding(.horizontal, 20)
                    .frame(width: 281, height: 105)
                    .background(Color("ColorBlackTransparentLight"))
                }//:HStack
                .frame(width: 285, height: 105)
            .offset(x: -66, y: isAnimating ? 75 : 220)
            .animation(slideInAnimation)
            .onAppear(perform: {
                isAnimating.toggle()
            })
        }// ZStack
        .frame(width: 480, height: 320, alignment: .center)
       
    }
}

struct HeaderView_Previews: PreviewProvider {
    
    static var headerInfo : [Header] = HeaderData
    static var previews: some View {
        HeaderView(headerContent: headerInfo[0])
            .previewLayout(.sizeThatFits)
            .environment(\.colorScheme, .dark)
    }
}

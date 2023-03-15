//
//  StartButtonView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 22/12/2020.
//

import SwiftUI
// PROPERTIES

// BODY
struct StartButtonView: View {
    
    
    @AppStorage("isOnboarding") var isBoarding : Bool?

    var body: some View {
        
        Button(action: {

            isBoarding = false
            
        }, label: {
            HStack {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            } //: H-STACK END
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
           
        })//: LABEL END
        .accentColor(.white)
    }
}


//PREVIEW
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}

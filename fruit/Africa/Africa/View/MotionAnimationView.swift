//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 04/01/2021.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimation = false
    //Coordinate
    func randomCoordinate(max:CGFloat)->CGFloat{
        return CGFloat.random(in: 0...max)
    }
    //Size
    func randomSize()->CGFloat{
        return CGFloat.random(in: 10...30)
    }
    //Scale
    func randomScale()->CGFloat{
        return CGFloat.random(in: 0.1...2.0)
    }
    //Speed
    func randomSpeed()->CGFloat{
        return CGFloat.random(in: 0.025...1.0)
    }
    //Delay
    func randomDelay()->CGFloat{
        return CGFloat.random(in: 0...2.0)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id:\.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaleEffect(isAnimation ? randomSize():1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                    )
                        .animation (
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(Double(randomSpeed()))
                                .delay(Double(randomDelay()))
                        )
                        .onAppear(perform: {
                            isAnimation = true
                        })
                }// Loop
            }// ZStack
            .drawingGroup()
        }// Geometry
        
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

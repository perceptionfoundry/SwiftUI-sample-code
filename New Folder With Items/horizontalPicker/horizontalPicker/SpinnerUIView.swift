//
//  SpinnerUIView.swift
//  horizontalPicker
//
//  Created by Syed ShahRukh Haider on 28/05/2021.
//

import SwiftUI

struct SpinnerUIView: View {
    
    @State private var fillPoint = 0.0
    @State private var colorIndex = 0
    let duration = 1.5
    var colors: [Color] = [.blue,.green,.yellow]
    private var animation : Animation{
        Animation.linear(duration: duration).repeatForever(autoreverses: false)
    }
    
    private var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { _ in
            
            if colorIndex + 1 >= self.colors.count{
                self.colorIndex = 0
            }else{
                self.colorIndex += 1
            }
        }
    }
    var body: some View {
        
        VStack{
            Spacer()

        Ring(fillPoint: fillPoint)
            .stroke(colors[colorIndex], lineWidth: 10)
            .frame(width: 200, height: 200)
            .onAppear(){
                withAnimation(self.animation) {
                    self.fillPoint = 1.0
                    _ = self.timer
                }
            }.padding(.vertical, 30)
            Spacer()
            VStack{
                Text("Your Biosensor is ready")
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("Glucose data is being recieved and will be display on your phone automatically")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
            }
            
            Button (action: {}, label: {
                
                ZStack{
                    Rectangle()
                        .fill(Color(UIColor(red: 0.089, green: 0.241, blue: 0.337, alpha: 1)))
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("START EXPLORING")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        
                }
            }).ignoresSafeArea()

        }
        .shadow(radius: 5)
        .frame(height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}


struct Ring:Shape {
    
    var fillPoint : Double
     var delayPoint: Double = 0.5
    var animatableData: Double{
        get {return fillPoint}
        set{ fillPoint = newValue}
    }
    
    func path(in rect: CGRect) -> Path{
        var start: Double = 0
        let end = 360 * fillPoint
        
        
        if fillPoint > delayPoint{
            start =  (2 * fillPoint) * 360
        }else{
            start = 0
        }
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.height/2), radius: rect.size.width/2, startAngle:.degrees(start), endAngle: .degrees(end), clockwise: false)
        
        return path
    }
}

struct SpinnerUIView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerUIView()
    }
}

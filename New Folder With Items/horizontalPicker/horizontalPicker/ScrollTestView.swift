//
//  ScrollView.swift
//  horizontalPicker
//
//  Created by Syed ShahRukh Haider on 28/05/2021.
//

import SwiftUI

struct ScrollTestView: View {
    
    @State var offset : CGFloat = 0
    var body: some View {
        VStack(spacing: 15){
            Image("IMG")
                .resizable()
                .frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 40)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Text("Weight")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            Text(" \(getWeight()) KG")
                .font(.system(size: 38, weight: .heavy))
                .foregroundColor(.purple)
            
            let pickerCount = 1
            customPicker(count: pickerCount, offset: $offset) {
                
               
                HStack(spacing: 0){
                    
                    ForEach(1...pickerCount, id:\.self){ index in
                        
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 30)
                            // Gap b/w to line
                            .frame(width:20)
                        
                        //subTick
                        ForEach(1...4, id:\.self){ index in
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 1, height: 15)
                                // Gap b/w to line
                                .frame(width:20)
                        }
                    }
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 1, height: 30)
                        // Gap b/w to line
                        .frame(width:20)
                }
            
            }
            .frame(height: 50)
            .overlay(
            Rectangle()
                .fill(Color.gray)
                .frame(width: 1, height: 50)
                .offset(x: 0.8, y: -30))
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight:.infinity)
        .background(
            Circle()
                .fill(Color.purple)
                .scaleEffect(1.5)
                .offset(y: -getRect().height / 2.4)
        )
        
    }
    
    func getWeight() -> String{
        let startWeight = 40
        
        let progress = offset / 20
        return "\(startWeight + (Int(progress) * 2))"
    }

}

struct ScrollTestView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollTestView()
    }
}

struct customPicker<Content : View> : UIViewRepresentable  {
    
    var content : Content
    //
    var pickerCount : Int
    @Binding var offSet : CGFloat
    
    init (count: Int,offset: Binding<CGFloat>,@ViewBuilder content: @escaping () -> Content){
        
        self.content = content()
        self._offSet = offset
        self.pickerCount = count
    }
    
    func makeCoordinator() -> Coordinator {
        return customPicker.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        let swiftUIView = UIHostingController(rootView: content).view!
        
        
        // So Swiftui width will be total of pickercount X 20 + screen size
        
        let width  = CGFloat((pickerCount * 5) * 20) + (getRect().width - 30_)
        
        swiftUIView.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        swiftUIView.backgroundColor = .green
        scrollView.backgroundColor = .red
        scrollView.contentSize = swiftUIView.frame.size
        scrollView.addSubview(swiftUIView)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        return scrollView
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
    
    }
    
    //delegate
   
   class Coordinator : NSObject,UIScrollViewDelegate{
       
       var parent : customPicker
       
       init(parent: customPicker){
           self.parent = parent
       }
       
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
           parent.offSet = scrollView.contentOffset.x
       }
       
     
       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           
           let offset = scrollView.contentOffset.x
           
           let value = ( offset / 20).rounded(.toNearestOrAwayFromZero)
           scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
       }
       func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
           
           if !decelerate{
               let offset = scrollView.contentOffset.x
               
               let value = ( offset / 20).rounded(.toNearestOrAwayFromZero)
               scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
           }
       }
   }

    
    
}

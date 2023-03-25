//
//  ContentView.swift
//  horizontalPicker
//
//  Created by Syed ShahRukh Haider on 28/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var offset : CGFloat = 0
    @State var offset1 : CGFloat = 0

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
            
          
            
            let pickerCount = 5
                        
            customPicker(count: pickerCount, offset: $offset1) {
                
               
                HStack(spacing: 0){
                    
                    ForEach(1...pickerCount, id:\.self){ index in
                        
                        Text("\(index)")
                            .foregroundColor(.gray)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.heavy)
                            .frame(width:20)
                        
                        
                        //subTick
                        ForEach(1...4, id:\.self){ index in
                            
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: 1, height: 15)
                                // Gap b/w to line
                                .frame(width:20)
                        }
                    }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
      
                    Text("\(pickerCount + 1)")
                        .foregroundColor(.gray)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.heavy)
                        .frame(width:20)
                        // Gap b/w to line
                        .frame(width:20)
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

            }
           
            .frame(height: 50)
            .overlay(
                Text("\(getValue(from: 1, index: offset1))")
                    .font(.system(size: 38, weight: .heavy))
                    .foregroundColor(.purple)
                    .padding()
                    .background(
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color.white.opacity(0.9))
                                        .frame(width: 40, height: 62, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 2)
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                        .frame(width: 66, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 2)
                        }
                    )
                    )
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight:.infinity)
        .background(Color.black)
        .background(
            Circle()
                .fill(Color.purple)
                .scaleEffect(1.5)
                .offset(y: -getRect().height / 2.4)
        )
        
    }
    
    func getWeight(from:Int) -> String{
        let startWeight = from
        
        let progress = offset / 20
        return "\(startWeight + (Int(progress * 0.2)))"
    }
    
    func getWeight1(from:Int) -> String{
        let startWeight = from
        
        let progress = offset1 / 20
        return "\(startWeight + (Int(progress * 0.2)))"
    }
    
    func getValue(from:Int, index:CGFloat) -> String{
        let startWeight = from
        
        let progress = index / 20
        return "\(startWeight + (Int(progress * 0.2)))"
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
   
}


func getRect() -> CGRect{
    return UIScreen.main.bounds
}




struct CustomSlider<Content: View>:UIViewRepresentable {
    
    var color: UIColor = .systemBackground
    var content : Content
    @Binding var offSet : CGFloat
    var pickerCount : Int
    init(pickerCount: Int,offset:Binding<CGFloat>, @ViewBuilder content : @escaping () -> Content){
        
        self.content = content()
        self._offSet = offset
        self.pickerCount = pickerCount
    }
    
    func makeCoordinator() -> Coordinator {
        return CustomSlider.Coordinator(parent: self)
    }
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        let swiftuiView = UIHostingController(rootView: content).view!
    
        
        let width  = CGFloat((pickerCount)) + (getRect().width + 50) // - 30
        
        swiftuiView.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        
        swiftuiView.backgroundColor = .green
        
            
        scrollView.contentSize = swiftuiView.frame.size
        scrollView.addSubview(swiftuiView)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
    }
     //delegate
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : CustomSlider
        
        init(parent: CustomSlider){
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

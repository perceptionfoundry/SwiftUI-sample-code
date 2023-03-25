//
//  SettigView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 25/12/2020.
//

import SwiftUI

struct SettingView: View {
    
    //Properties
    @Environment(\.presentationMode) var presentationMode
  
    @AppStorage("isOnboarding") var isBoarding : Bool = false
    //Body
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    GroupBox(
                     label: SettingLabelView(title: "Fructus", logo: "info.circle")
                    ){
                     
                     HStack{
                         Divider()
                             .padding(.vertical, 4)
                         Image("logo")
                             .resizable()
                             .scaledToFit()
                             .frame(width: 80, height: 80)
                             .cornerRadius(9)
                         Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                             .font(.footnote)
             //                .multilineTextAlignment(.leading)
                     }//: HStack End
                     
                    }// : GroupBox End

                    GroupBox(label: SettingLabelView(title: "Customize", logo: "paintbrush"), content: {
                        
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .font(.footnote)
                            .padding(.vertical, 8)
                            .frame(minHeight:60)
                            .layoutPriority(1)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isBoarding, label: {
                            
                            if isBoarding {
                                Text("Restart")
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart")
                                    .foregroundColor(.gray)
                            }
                        })
                        .padding()
                        .background(
                        
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                        )
                        
                        
                    })
                    
                    
                    GroupBox(
                        label: SettingLabelView(title:"Application", logo: "app.iphone")
                    ){
                        Divider()
                            .padding(.vertical, 4)
                        SettingRowView(name: "Developer", content: "S.Shahrukh Haider")
                        SettingRowView(name: "Designer", content: "Practice App Designer")
                        SettingRowView(name: "Compatiatibity", content: "iOS 14")
                        SettingRowView(name: "Website",linkLabel: "Reference link", linkDescription: "www.google.com")
                        SettingRowView(name: "Twitter", linkLabel: "shahaider", linkDescription: "www.twitter.com")
                        SettingRowView(name: "SwiftUI", content:"S.Shahrukh Haider")
                        SettingRowView(name: "Version", content: "S.Shahrukh Haider")
                    }// :: GroupBox End
                    
                    
                }
                .navigationBarTitle("Setting", displayMode: .large)
                .navigationBarItems(trailing:
                                        Button(action: {
                                            presentationMode.wrappedValue.dismiss()
                                        }, label: {
                                            Image(systemName: "xmark")
                                        })
                )
                .padding()
            })// : Scroll View end
            
          
        }//: Navigation view End
       
        
    }
}


//PREVIEW
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11 Pro")
    }
}

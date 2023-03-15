//
//  SettingRowView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 25/12/2020.
//

import SwiftUI

struct SettingRowView: View {
    
    //PROPERTIES
    
    var name: String
    var content : String? = nil
    var linkLabel : String? = nil
    var linkDescription : String? = nil
    
    //BODY
    var body: some View {
        
        VStack {
            
            Divider()
                .padding(.vertical, 4)
            
            HStack {
                Text(name)
                    .foregroundColor(Color.gray)
                Spacer()
                
                if (content != nil) {
                    Text(content!)
                }else if (linkLabel != nil && linkDescription != nil){
                    Link(linkLabel!, destination:URL(string: "https://\((linkDescription)!)")!)
                    Image(systemName:"arrow.up.right.square").foregroundColor(.pink)
                }
                else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
            .padding(.horizontal, 10)
        }
        
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(name: "Developer", content: "Shahrukh")
            .previewLayout(.fixed(width:375, height:60))
        
        SettingRowView(name: "Website",linkLabel:"Profile", linkDescription: "www.google.com")
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width:375, height:60))
    }
}

//
//  SettingLabelView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 25/12/2020.
//

import SwiftUI

struct SettingLabelView: View {
    
    
    var title : String
    var logo : String
    
    var body: some View {
      
            HStack {
                Text(title.uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: logo)
                
            }
        
    }
}

struct SettingLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingLabelView(title: "Fructus", logo: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

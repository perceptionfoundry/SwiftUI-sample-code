//
//  VideolistView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 03/01/2021.
//

import SwiftUI

struct VideoRowView: View {
    
    
    var video : VideoModel
    
    var body: some View {
        
        HStack {
            ZStack {
                Image(video.thumbail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(12)
                   
                Image(systemName: "play.circle")
                    .imageScale(.large)
                    .frame(height: 32)
                    .scaledToFill()
                    .shadow(radius: 4)
      
            }//: ZStack End
            
            VStack(alignment:.center, spacing:10){
                Text(video.name)
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                    .font(.title)
                
                Text(video.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        } //: HStack End
    }
}

struct VideoRowView_Previews: PreviewProvider {
    
    static var videos : [VideoModel] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoRowView(video: videos[4])
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}

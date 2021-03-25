//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 03/01/2021.
//

import SwiftUI
import AVKit


struct VideoPlayerView: View {
    
    let selectedVideo : String
    let videoTitle : String
    
    var body: some View {
        
        VStack {
            VideoPlayer(player: playVideo(fileName: selectedVideo, fileFormat: "mp4")){
                
                
                //            Text(videoTitle)
            }
            .overlay(
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                ,alignment: .topLeading
                
            )

        }//: VStack End
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static let videos : [VideoModel] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        
        NavigationView{
        VideoPlayerView(selectedVideo: videos[3].id, videoTitle: videos[3].name)
        }
    }
}

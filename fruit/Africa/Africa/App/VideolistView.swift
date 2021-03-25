//
//  VideolistView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI

struct VideolistView: View {
   
    @State var videos : [VideoModel] = Bundle.main.decode("videos.json")
    var hapticImpact = UIImpactFeedbackGenerator()
    var body: some View {
        
        
        NavigationView {
            List{
                ForEach(videos) { video in
                    NavigationLink(destination:VideoPlayerView(selectedVideo: video.id, videoTitle: video.name)) {
                        VideoRowView(video: video)
                            .padding(.vertical, 8)
                    }
                }// LOOP
            }// List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "shuffle")
                    })
                }
            }//toolbar
                                   
        }//Navi
        
        
    }
}

struct VideolistView_Previews: PreviewProvider {
    static var previews: some View {
       
     
        VideolistView()
            .previewDevice("iPhone 11 Pro")
      
    }
}

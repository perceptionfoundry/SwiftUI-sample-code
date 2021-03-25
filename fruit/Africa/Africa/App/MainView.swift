//
//  MainView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
       
        TabView{
        ContentView()
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Browse")
            }
            
            
        VideolistView()
            .tabItem {
                Image(systemName: "play.rectangle")
                Text("Browse")
            }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
            
            
        }//: Tabview End
        .padding(.horizontal, 10)
        
//        .padding(.vertical, 2)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 11 Pro")
    }
}

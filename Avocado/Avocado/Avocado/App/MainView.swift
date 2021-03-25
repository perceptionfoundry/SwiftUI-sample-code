//
//  MainView.swift
//  Avocado
//
//  Created by Syed ShahRukh Haider on 07/01/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image("tabicon-avocado")
                    Text("Avacodo")
                        .foregroundColor(.accentColor)
                }
            
            ReceiptView()
                .tabItem {
                    Image("tabicon-book")
                    Text("Avacodo")
                }
            RipeningStagesView()
                .tabItem {
                    Image("tabicon-branch")
                    Text("Avacodo")
                }
            SettingView()
                .tabItem {
                    Image("tabicon-settings")
                    Text("Avacodo")
                }
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(.primary)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

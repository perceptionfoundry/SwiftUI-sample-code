//
//  ContentView.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 22/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingSetting = false
    
    var fruits = fruitsData
    
    // BODY
    var body: some View {
        
        NavigationView{
            
            List{
                
                ForEach(fruits.shuffled()){ item in
                    
                    // Segue on row selectio
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)){
                        
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                    
                    
                    
                    
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing:
                                    
                                    Button(action: {
                                        isShowingSetting = true
                                    }, label: {
                                        Image(systemName: "slider.horizontal.3")
                                    })
                                    .sheet(isPresented: $isShowingSetting, content: {
                                        SettingView()
                                    })
            )
        }// Navigation View End
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}

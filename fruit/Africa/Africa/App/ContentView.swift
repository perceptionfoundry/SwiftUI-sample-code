//
//  ContentView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
  
    var animals : [Animals] = Bundle.main.decode("animals.json")
    @State var isGrid = false
    @State  var gridLayout = [GridItem(.flexible())]
    @State var gridCloumn : Double = 1
    @State var GridIcon : String = "square.grid.2x2"
    
    
    
    
    func gridSwitch(){
        
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1 )
        gridCloumn = Double(gridLayout.count)
        switch gridCloumn {
        case 1:
            GridIcon = "square.grid.2x2"
        case 2:
            GridIcon = "square.grid.3x2"

        case 3:
            GridIcon = "rectangle.grid.1x2"

        default:
            GridIcon = "square.grid.2x2"

        }
    }
    
    var body: some View {
      
        NavigationView{
            Group {
                if isGrid == false {
                    List{
                    CoverImageView()
                        .frame(height:300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    ForEach(animals) { (animal) in
                        
                        NavigationLink(destination : AnimalDetailView(animal: animal)){
                            
                            AnimalListView(animal:  animal)
                            
                        }// Navi-link

                    }//Loop
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        
                        LazyVGrid(columns: gridLayout,alignment:.center ,content: {
                           
                            ForEach(animals) { item in
                                
                                NavigationLink(
                                    destination: AnimalDetailView(animal: item)){
                                        
                                        BigGridImageView(animal: item)
                                    }
                            }

                        })
                    }// Scroll
                }// list end
            }//Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
                        
                        Button(action: {
                            
                            isGrid = false
                            
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .foregroundColor(isGrid ?  .white : .accentColor)
                        })
                        
                        Button(action: {
                            isGrid = true
                            gridSwitch()
                        }, label: {
                            Image(systemName: GridIcon)
                                .foregroundColor(isGrid ? .accentColor :.white)
                        })
                        
                        
                        
                    }
                }
        })
          
            
            
        }//: navi end
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}

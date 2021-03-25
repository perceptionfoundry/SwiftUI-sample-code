//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Syed ShahRukh Haider on 02/01/2021.
//

import SwiftUI

struct AnimalDetailView: View {
   
    let animal : Animals
    
    var body: some View {
        
        

        ScrollView{
  
            VStack(alignment: .center,spacing:10){
                
                //Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                  
                // TITLE
                Text(animal.name.uppercased())
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 25)
                    )
                             
                
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //GALLERY
                Group{
                    HeaderView(headingImage: "photo.on.rectangle", headingTitle: "wilderness in Picture")
                    InsetGalleryView(animals: animal)
                }
                .padding(.horizontal)
                //FACTS
                Group{
                    HeaderView(headingImage: "questionMark.circle", headingTitle: "Fact")
                    InsetFact(animal: animal)
                }
                .padding(.horizontal)
                
                //DESCRIPTION
                
                Group{
                    HeaderView(headingImage: "info.circle", headingTitle: "Description")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        
                }
                .padding(.horizontal)
               
                //MAP
                Group{
                    HeaderView(headingImage: "map", headingTitle: "Map")
                  InsetMap()
                        
                }
               
                
                //LINK
                
                Group{
                    HeaderView(headingImage: "Globe", headingTitle: "Link")
                  InsetLink(animals: animal)
                        
                }
                .padding(.horizontal)
            }//: VStack End
         
         
//
        }//: Scroll End
       
        .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
  
   static let animal : [Animals] = Bundle.main.decode("animals.json")
    
    static var previews: some View {

        NavigationView{
            AnimalDetailView(animal: animal[0])
                .previewDevice("iPhone 11 Pro")
            
          
        }
    }
}

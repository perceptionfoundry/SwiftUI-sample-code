//
//  Graph.swift
//  Graph
//
//  Created by Syed ShahRukh Haider on 13/04/2021.
//

import WidgetKit
import SwiftUI





//1. create model for JSON data

struct JSONModel: Decodable, Hashable {
    
    var date : CGFloat
    var units : Int
    
}

//2. Create Model for widget data

struct Model: TimelineEntry {
    
    var date : Date
    var widgetData : [JSONModel]
}







//3. Create Provider for providing Data for widget

struct Provider: TimelineProvider {
    
    
    //------------------------------ Protocol ---------------------------//
    
    func getSnapshot(in context: Context, completion: @escaping (Model) -> Void) {
        
        //initial load data
        let loadingData = Model(date: Date(), widgetData: Array(repeating: JSONModel(date: 0, units: 0), count: 6))
        
        completion(loadingData)
    }
    
    
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Model>) -> Void) {
        
        // parsing json data
        
        
        getData { (modelData) in
            
            //Current Date
            let date = Date()
            
            //Fetch Date populate
            let data = Model(date: date, widgetData: modelData)
            
            
            //Define Interval
            let nextUpdate = Calendar.current.date(byAdding: .minute,value: 15, to: date)
            //Cofigure Timeline
            let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
            
            completion(timeline)
        }
    }
    
    
    // SAFE GAME ADDING PLACEHOLDER
    func placeholder(in context: Context) -> Model {
        return Model(date: Date(), widgetData: Array(repeating: JSONModel(date: 0, units: 0), count: 6))
    }
    
    
    
    //---------------------------------------------------------------//
    
    
    // ************* Create Extracted Widget UI Design *********
    struct WidgetView : View {
        
        // Initialize widget size family
        @Environment(\.widgetFamily) var family
        
        var data : Model
        var color = [Color.red, Color.yellow, Color.red, Color.blue, Color.green, Color.pink, Color.purple]
        
        @ViewBuilder // <-  To add logic to View
       
        var body: some View{
            
            switch family{
            
            //** SMALL
            case .systemSmall:
                VStack(alignment: .leading, spacing: 15, content: {
                    
             
                    
                    
                    HStack(spacing: 15){
                        ForEach(data.widgetData, id:\.self){value in
                            
                            if value.units == 0 && value.date == 0 {
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.gray)
                                
                            }else{
                                // data view
                                VStack(spacing: 15){
                                    
                                    
                                    GeometryReader{ g in
                                        
                                        VStack{
                                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                                            
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(color.randomElement()!)
                                                .frame(height: getHeight(value: CGFloat(value.units), height: g.frame(in: .global).height))
                                        }
                                        
                                        
                                    }
                                    
                                 
                                    
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                })
        
                
                
            //** MEDIUM
            case .systemMedium:
                VStack(alignment: .leading, spacing: 15, content: {
                    
               
                    
                    
                    HStack(spacing: 15){
                        ForEach(data.widgetData, id:\.self){value in
                            
                            if value.units == 0 && value.date == 0 {
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.gray)
                                
                            }else{
                                // data view
                                VStack(spacing: 15){
                                    
                                    
                                    Text("\(value.units)")
                                        .fontWeight(.bold)
                                    
                                    
                                    GeometryReader{ g in
                                        
                                        VStack{
                                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                                            
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(color.randomElement()!)
                                                .frame(height: getHeight(value: CGFloat(value.units), height: g.frame(in: .global).height))
                                        }
                                        
                                        
                                    }
                                    
                                    
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                })
                
                
                
                
            //** LARGE
            default:
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    HStack(spacing: 15){
                        Text("Unit Sold")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(Date(), style: .time)
                            .font(.caption2)
                    }
                    .padding()
                    
                    
                    HStack(spacing: 15){
                        ForEach(data.widgetData, id:\.self){value in
                            
                            if value.units == 0 && value.date == 0 {
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.gray)
                                
                            }else{
                                // data view
                                VStack(spacing: 15){
                                    
                                    
                                    Text("\(value.units)")
                                        .fontWeight(.bold)
                                    
                                    
                                    GeometryReader{ g in
                                        
                                        VStack{
                                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                                            
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(color.randomElement()!)
                                                .frame(height: getHeight(value: CGFloat(value.units), height: g.frame(in: .global).height))
                                        }
                                        
                                        
                                    }
                                    
                                    //DATE
                                    
                                    Text(getDate(value: value.date))
                                    
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                })
            }
            
            
           
            
        }
        
        
        func getHeight(value:CGFloat, height:CGFloat) -> CGFloat{
            let max = data.widgetData.max { (first, second) -> Bool in
                
                if first.units > second.units {return false}
                
                else{return true}
            }
            
            let percent = value / CGFloat(max!.units)
            
            return percent * height
        }
        
        func getDate(value:CGFloat)->String{
            let format = DateFormatter()
            format.dateFormat = "MMM dd"
            
            let date = Date(timeIntervalSince1970: Double(value) / 1000.0)
            
            return format.string(from: date)
            
        }
    }
    
    
    
    func getData(completion:@escaping([JSONModel])->()) {
        
        let url = "https://canvasjs.com/data/gallery/javascript/daily-sales-data.json"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            if err != nil{
                print(err!.localizedDescription)
                return
            }
            
            do{
                let jsonData = try JSONDecoder().decode([JSONModel].self, from: data!)
                
                completion(jsonData)
            }catch{
                print(err!.localizedDescription)
            }
        }.resume()
        
    }
    
    
    
    
    // WIDGET CONFIGURATION
    
    @main
    struct MainWidget : Widget {
        
        var body: some WidgetConfiguration{
            StaticConfiguration(kind: "Graph", provider: Provider()) { (data) in
                
                WidgetView(data: data)
                
            }.description(Text("Daily Status"))
            .configurationDisplayName(Text("Daily updates"))
            .supportedFamilies([.systemLarge, .systemMedium, .systemSmall])
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

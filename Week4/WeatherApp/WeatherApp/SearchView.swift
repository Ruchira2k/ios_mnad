//
//  SearchView.swift
//  WeatherApp
//
//  Created by Ruchira Sahabandu  on 2023-02-17.
//

import SwiftUI

struct SearchView: View {
    @State var cityName: String = ""
    
    @StateObject var networkStore = NetworkStore()
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Weather")
                    .font(.largeTitle)
                    .bold()
                HStack{
                    TextField("City Name", text:$cityName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        guard !cityName.isEmpty else { return }
                        print("Dev test fetching data")
                        Task {
                            await networkStore.fetchData(cityName: cityName)
                        }
                    } label: {
                        Text("Search")
                    }
                }
                
                if let data = networkStore.weatherData {
                    // Could use a LazyVGrid instead
                    HStack{
                        WeatherConditionView(image: "aqi.low", title:"\(data.description)", subtitle: "Current Status")
                        
                        WeatherConditionView(image: "thermometer.low", title:"\(data.temp)", subtitle: "Temperature (ºC)")
                    }
                    
                    HStack{
                        WeatherConditionView(image: "humidity", title:"\(data.humidity)", subtitle: "Humidity (%)")
                        
                        WeatherConditionView(image: "tornado", title:"\(data.pressure)", subtitle: "Pressure (Mbar)")
                    }
                    
                    HStack{
                        WeatherConditionView(image: "sun.dust", title:"\(data.visiblity)", subtitle: "Visibility")
                        
                        WeatherConditionView(image: "wind", title:"\(data.windSpeed)", subtitle: "Wind Speed (km/h)")
                    }
                    WeatherConditionView(image: "cloud.fill", title:"\(data.cloudPercentage)", subtitle: "Clouds(%)")
                }
                
            }.padding()
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

// This is reusable
struct WeatherConditionView: View {
    var image: String = ""
    var title: String = ""
    var subtitle: String = ""
    
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width * 0.45, height: 200)
                .foregroundColor(.gray).opacity(0.4)
            
            VStack(spacing: 15){
                Image(systemName: image).font(.system(size: 50))
                
                Text(title)
                    .font(.system(size: 20)).bold()
                
                Text(subtitle)
            }
        }
    }
}

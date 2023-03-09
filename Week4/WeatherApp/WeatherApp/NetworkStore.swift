//
//  NetworkStore.swift
//  WeatherApp
//
//  Created by Ruchira Sahabandu  on 2023-02-17.
//

import Foundation

class NetworkStore: ObservableObject {
    @Published var weatherData: WeatherDataModel?
    
    private var baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIConstants.KEY)&units=metric"
    
//    "https://api.openweathermap.org/data/2.5/weather?appid=b743d250bb679584c785b4ddbb48b969&units=metric&q-colombo"
//    <space> is represented in urls by %20
    func fetchData(cityName: String) async {
        var urlString = "\(baseURL)&q=\(cityName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""// Formats URL by replacing spaces with %20
        
        //URL
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        // URL Session
        // Swift error handling
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode
            let decodableData = try JSONDecoder().decode(WeatherDTO.self, from: data)
//            print(decodableData.weather[0].description)
            DispatchQueue.main.async {
                self.weatherData = WeatherDataModel(name: decodableData.name,
                                                    description: decodableData.weather[0].description.capitalized,
                                               temp: decodableData.main.temp,
                                               pressure: decodableData.main.pressure,
                                               humidity: decodableData.main.humidity,
                                               feelsLike: decodableData.main.feelsLike,
                                               visiblity: decodableData.visibility,
                                               windSpeed: decodableData.wind.speed,
                                               cloudPercentage: decodableData.clouds.all)
            }
            
        } catch {
            print("Decoding Failed")
        }
        
        
        
        
    }
}

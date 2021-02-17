//
//  WeatherManager.swift
//  Clima
//
//  Created by Евгений Тележенко on 16.02.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation


protocol WeatherDataReciever {
    func didUpdateWeather (weather: WeatherModel)
}

struct WeatherManager {
    
    var delegate: WeatherDataReciever?
    // URL, with necessary additions : metric system, id (city will be changeable parameter)
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&units=metric&appid=1ebfebf9449b1ccfed43421cf76be575"
    //Function, that inserts cityname in url
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create URL
        if let url = URL(string: urlString) {
            // 2. Create session
            let session = URLSession(configuration: .default)
            // 3. Give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                // If task proceed successfully, we'll encode incoming data
                if let safeData = data {
                    if let weather = parseJSON(weatherData: safeData) {
                        delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            // 4. Start task
            task.resume()
        }
    }
    // Parse JSON method . weatherData in description - from session dataTask in decoder - from WeatherData structure
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
    // Keep in mind this construction (error catching)
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherId = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: weatherId, cityName: name, temperature: temp)
            return weather
        } catch {
            return nil
        }
    }

}

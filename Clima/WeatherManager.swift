//
//  WeatherManager.swift
//  Clima
//
//  Created by Евгений Тележенко on 16.02.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
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
            let task = session.dataTask(with:  url, completionHandler: handle(data:response:error:))
            // 4. Start task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        //If error will come, we'll handle it and stop task
        if error != nil {
            print(error!)
            print("SHALALVALVLAVLLA")
            return
        }
        
        // If task proceed successfully, we'll encode incoming data
        if let safeData = data {
            
            // To decode incoming data and turn it into string, use this 
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
            
        }
    }
    
}

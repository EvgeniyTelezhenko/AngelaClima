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
    let weatherURL = "api.openweathermap.org/data/2.5/weather?q=London&units=metric&appid=1ebfebf9449b1ccfed43421cf76be575"
    //Function, that inserts cityname in url
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}

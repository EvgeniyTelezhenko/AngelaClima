//
//  WeatherModel.swift
//  Clima
//
//  Created by Евгений Тележенко on 17.02.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

// Created to organize code and separate JSON decoding model and UI of our app
struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperaratureString: String {
        return String(format: "%.1f", temperature )
        
    }
  
    
    //Computed property. Needed to make code shorter in weather manager and to be able to take it in every place of code
    var conditionName: String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}

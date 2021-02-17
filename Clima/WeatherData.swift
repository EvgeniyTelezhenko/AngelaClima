//
//  WeatherData.swift
//  Clima
//
//  Created by Евгений Тележенко on 17.02.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

//Structure, that describes incoming data (name)
// For temperature and all data that placed in 2nd level - create structure like Main and create constants
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
}

// To take information from 2nd level array - create structure with main type and hold it into square brackets(watch WeatherData - weather)
struct Weather: Codable {
    let id: Int
    let description: String
}


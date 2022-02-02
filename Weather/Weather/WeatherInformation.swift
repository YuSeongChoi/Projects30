//
//  WeatherInformation.swift
//  Weather
//
//  Created by Mac on 2022/02/02.
//

import Foundation

struct WeatherInformation: Codable {
    let weather: [Wheater]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}

struct Wheater: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}

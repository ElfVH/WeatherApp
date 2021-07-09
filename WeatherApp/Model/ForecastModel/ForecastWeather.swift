//
//  ForecastWeather.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 7/7/2564 BE.
//

import Foundation

// MARK: - Weather
struct ForecastWeather: Codable {
    let id: Int
    let main: MainEnum
    let description: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case description = "description"
        case icon
    }
}

enum Icon: String, Codable {
    case the04D = "04d"
    case the04N = "04n"
    case the10D = "10d"
    case the10N = "10n"
}

enum MainEnum: String, Codable {
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description: String, Codable {
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
}

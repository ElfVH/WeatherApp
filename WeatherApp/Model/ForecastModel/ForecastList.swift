//
//  ForecastList.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 7/7/2564 BE.
//

import Foundation

// MARK: - List
struct ForecastList: Codable {
    let dt: Int
    let main: ForecastMainClass
    let weather: [ForecastWeather]
    let clouds: ForecastClouds
    let wind: ForecastWind
    let visibility: Int
    let pop: Double
    let rain: ForecastRain?
    let sys: ForecastSys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}

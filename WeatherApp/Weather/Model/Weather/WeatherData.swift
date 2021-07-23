//
//  WeatherData.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 6/7/2564 BE.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind?
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}














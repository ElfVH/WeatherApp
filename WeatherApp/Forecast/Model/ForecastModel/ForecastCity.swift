//
//  ForecastCity.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 7/7/2564 BE.
//

import Foundation

// MARK: - City
struct ForecastCity: Codable {
    let id: Int
    let name: String
    let coord: ForecastCoord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

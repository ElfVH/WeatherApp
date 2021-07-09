//
//  ForecastWind.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 7/7/2564 BE.
//

import Foundation

// MARK: - Wind
struct ForecastWind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

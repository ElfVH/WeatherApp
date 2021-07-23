//
//  Wind.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 6/7/2564 BE.
//

import Foundation

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

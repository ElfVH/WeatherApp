//
//  Weather.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 6/7/2564 BE.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

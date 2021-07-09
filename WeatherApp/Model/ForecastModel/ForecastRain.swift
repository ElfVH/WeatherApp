//
//  ForecastRain.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 7/7/2564 BE.
//

import Foundation

// MARK: - Rain
struct ForecastRain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

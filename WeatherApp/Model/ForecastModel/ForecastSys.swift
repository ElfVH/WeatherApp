//
//  ForecastSys.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 7/7/2564 BE.
//

import Foundation

// MARK: - Sys
struct ForecastSys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

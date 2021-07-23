//
//  Sys.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 6/7/2564 BE.
//

import Foundation

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

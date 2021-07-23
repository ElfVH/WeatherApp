//
//  ChangeTempUseCase.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 22/7/2564 BE.
//

import Foundation

enum ChangeWeatherTemperatureTypeUseCase {

    struct Request {
        var tempType: TempType
    }

    struct Response {
        var temperature: Double?
        var tempType: TempType
    }
    
    struct ViewModel {
        var temperature: String
    }
    
}

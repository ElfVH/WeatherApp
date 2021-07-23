//
//  GetWeatherCityNameUseCase.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 19/7/2564 BE.
//

import Foundation
enum GetWeatherCityNameUseCase {

    struct Request {
        var cityName: String
    }

    struct Response {
        var weatherData: WeatherData
        var tempType: TempType
    }

    struct ViewModel {
        var weatherViewModel: WeatherViewModel
    }
}

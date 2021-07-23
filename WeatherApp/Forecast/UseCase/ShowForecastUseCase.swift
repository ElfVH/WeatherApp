//
//  ShowForecastUseCase.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 22/7/2564 BE.
//

import Foundation

enum ShowForecastUseCase{
    struct Request {
        
    }
    
    struct Response {
        var forecastData: ForecastData
    }
    
    struct ViewModel {
        var forecastViewModels: [DateForecastViewModel]
    }
}

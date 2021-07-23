//
//  ForecastWorker.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 22/7/2564 BE.
//

import Foundation
protocol IForecastWorker {
    func getForecast(completion: @escaping (Swift.Result<ForecastData, Error>) -> Void)
}

struct ForecastWorker {
    let forecastAPIService: WeatherAPIService
    var cityName: String
    
    
    init(cityName: String, forecastAPIService: WeatherAPIService){
        self.cityName = cityName
        self.forecastAPIService = forecastAPIService
    }
}

extension ForecastWorker: IForecastWorker {
    func getForecast(completion: @escaping (Swift.Result<ForecastData, Error>) -> Void) {
        print("this is my \(self.cityName)")
        forecastAPIService.getForecast(city: self.cityName, completion: {(result) in
            switch result {
            case .success(let forecastData):
                DispatchQueue.main.async {
                    completion(.success(forecastData))
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        })
    }

}

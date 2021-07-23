//
//  WeatherWorker.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 14/7/2564 BE.
//

import Foundation

protocol IWeatherWorker {
    var tempType: TempType { get set }
    var temperature: Double? { get }
    func getWeather(cityName: String, completion: @escaping (Swift.Result<WeatherData, Error>) -> Void)
}

class WeatherWorker {
    let weatherAPIService: WeatherAPIService
    var tempType: TempType = .celcius
    var weatherData: WeatherData?
    init(weatherAPIService: WeatherAPIService) {
        self.weatherAPIService = weatherAPIService
    }
    
}

extension WeatherWorker: IWeatherWorker {
    var temperature: Double? {
        weatherData?.main.temp
    }
    
    func getWeather(cityName: String, completion: @escaping (Swift.Result<WeatherData, Error>) -> Void) {
        weatherAPIService.getWeather(city: cityName, completion: {(result) in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.weatherData = weatherData
                    completion(.success(weatherData))
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))                    
                }
            }
        })
    
        
        
    }
}

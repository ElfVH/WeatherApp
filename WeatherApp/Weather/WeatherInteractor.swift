//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 14/7/2564 BE.
//

import Foundation

protocol IWeatherInteractor {
    func getWeather(request: GetWeatherCityNameUseCase.Request)
    func changeTemp(request: ChangeWeatherTemperatureTypeUseCase.Request)
}

class WeatherInteractor {
    
    let presenter: IWeatherPresenter
    var worker: IWeatherWorker
    
    init(presenter: IWeatherPresenter, worker: IWeatherWorker){
        self.presenter = presenter
        self.worker = worker
    }
}

extension WeatherInteractor: IWeatherInteractor {
    func changeTemp(request: ChangeWeatherTemperatureTypeUseCase.Request) {
        worker.tempType = request.tempType
        let temperature = worker.temperature
        let response = ChangeWeatherTemperatureTypeUseCase.Response(temperature: temperature, tempType: worker.tempType)
        presenter.presentTemperature(response: response)
        
    }
    
    func getWeather(request: GetWeatherCityNameUseCase.Request) {
        worker.getWeather(cityName: request.cityName) { result in
            switch result {
            case .success(let weatherData):
                let response = GetWeatherCityNameUseCase.Response(weatherData: weatherData, tempType: self.worker.tempType)
                self.presenter.presentWeather(response: response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}


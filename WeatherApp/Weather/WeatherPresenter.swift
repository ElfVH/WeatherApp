//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 14/7/2564 BE.
//

import Foundation

protocol IWeatherPresenter {
    func presentWeather(response: GetWeatherCityNameUseCase.Response)
    func presentTemperature(response: ChangeWeatherTemperatureTypeUseCase.Response)
}

struct WeatherPresenter {
    weak var viewController: IWeatherViewController?
    
    init(viewController: IWeatherViewController) {
        self.viewController = viewController
    }
}

extension WeatherPresenter: IWeatherPresenter {
    func presentTemperature(response: ChangeWeatherTemperatureTypeUseCase.Response) {
        guard let temperature = response.temperature else {
            return
        }
        let constantTemperature = temperature - 273.15
        var temperatureString: String = "-"
        switch response.tempType {
        case .celcius:
            let tempCelcius = Double(round(10*constantTemperature)/10)
            temperatureString = "\(String(tempCelcius)) °C"
            
        case .farenheit:
            let tempF = constantTemperature * Double(9/5) + Double(32)
            let tempFarenheit = Double(round(10*tempF)/10)
            temperatureString = "\(String(tempFarenheit)) °F"
        }
        let showTemperature = ChangeWeatherTemperatureTypeUseCase.ViewModel(temperature: temperatureString)
        
        viewController?.changeTemp(viewModel: showTemperature)
        
    }
    
    func presentWeather(response: GetWeatherCityNameUseCase.Response) {
        let weatherViewModel = WeatherViewModel(name: response.weatherData.name,
                                                country: response.weatherData.sys.country,
                                                date: response.weatherData.dt,
                                                temp: response.weatherData.main.temp,
                                                conditionText: response.weatherData.weather.first?.main,
                                                conditionIcon: response.weatherData.weather.first?.icon,
                                                humidity: response.weatherData.main.humidity,
                                                tempType: response.tempType)
        let viewModel = GetWeatherCityNameUseCase.ViewModel(weatherViewModel: weatherViewModel)
        viewController?.showWeather(viewModel: viewModel)
    }
    
    
}

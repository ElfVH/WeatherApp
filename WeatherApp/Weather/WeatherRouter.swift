//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 14/7/2564 BE.
//

import Foundation
import UIKit

protocol IWeatherRouter {
    func openForecast(viewController: UIViewController, cityName: String)
}

struct WeatherRouter {
    
}

extension WeatherRouter: IWeatherRouter {
    func openForecast(viewController: UIViewController, cityName: String) {
        let vc = ForecastAssembly().build(cityName: cityName)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

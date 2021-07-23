//
//  ForecastAssembly.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 22/7/2564 BE.
//

import Foundation
import UIKit

protocol IForecastAssembly {
    func build(cityName: String) -> UIViewController
}

struct ForecastAssembly {
    
}

extension ForecastAssembly: IForecastAssembly {
    
    func build(cityName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Forecast", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ForecastViewControllerID") as! ForecastViewController
        
        let forecastAPI = WeatherAPIService(apiClient: APIClient())
        
        let worker = ForecastWorker(cityName: cityName, forecastAPIService: forecastAPI)
        let presenter = ForecastPresenter(viewController: vc)
        
        let interactor = ForecastInteractor(presenter: presenter, worker: worker)
        
        vc.interactor = interactor
        
        return vc

    }
}


//
//  WeatherAssembly.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 19/7/2564 BE.
//

import Foundation
import UIKit

protocol IWeatherAssembly {
    func build() -> UIViewController
}

struct WeatherAssembly {
    
}

extension WeatherAssembly: IWeatherAssembly {
    
    func build() -> UIViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let viewController = storyBoard.instantiateViewController(identifier: "WeatherViewControllerID") as! WeatherViewController
        let weatherAPI = WeatherAPIService(apiClient: APIClient())

        let presenter = WeatherPresenter(viewController: viewController)
        let worker = WeatherWorker(weatherAPIService: weatherAPI)
        
        let interactor = WeatherInteractor(presenter: presenter, worker: worker)
        let router = WeatherRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        let navigationViewController = UINavigationController()
        navigationViewController.viewControllers = [viewController]
        
        return navigationViewController
    }
}


//
//  ForecastInteractor.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 22/7/2564 BE.
//

import Foundation

protocol IForecastInteractor {
    func getForecast()
}

struct ForecastInteractor {
    
    let presenter: IForecastPresenter
    var worker: IForecastWorker
    
    init(presenter: IForecastPresenter, worker: IForecastWorker){
        self.presenter = presenter
        self.worker = worker
    }
}

extension ForecastInteractor: IForecastInteractor {
    
    func getForecast() {
        worker.getForecast{ result in
            switch result{
            case .success(let forecastData):
                let response = ShowForecastUseCase.Response(forecastData: forecastData)
                presenter.presentForecast(response: response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

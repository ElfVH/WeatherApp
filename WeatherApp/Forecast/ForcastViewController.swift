//
//  ForcastViewController.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 30/6/2564 BE.
//

import UIKit

protocol IForecastViewController: AnyObject{
    func showWeather(viewModel: ShowForecastUseCase.ViewModel)
}

class ForecastViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var interactor: IForecastInteractor?
    
    var dateForecasts: [DateForecastViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        interactor?.getForecast()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateForecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomViewCell
        let dateForecast = dateForecasts[indexPath.row]
        let text = dateForecast.date
        let date = dateForecast.timeForecasts
        cell.timeForecasts = date
        cell.day.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

//MARK: - IForecastViewController

extension ForecastViewController: IForecastViewController {
    func showWeather(viewModel: ShowForecastUseCase.ViewModel) {
        self.dateForecasts = viewModel.forecastViewModels
        tableView.reloadData()
    }
}



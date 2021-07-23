//
//  ViewController.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 30/6/2564 BE.
//

import UIKit
import SDWebImage

protocol IWeatherViewController: AnyObject {
    func showWeather(viewModel: GetWeatherCityNameUseCase.ViewModel)
    func changeTemp(viewModel: ChangeWeatherTemperatureTypeUseCase.ViewModel)
}

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var segmentBar: UISegmentedControl!
    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!

    var interactor: IWeatherInteractor?
    var router: IWeatherRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        searchBar.isHidden = true
        searchTextField.placeholder = "City"
        getWeather(cityName: "London")
    }
    
    @IBAction func showSearchBar(_ sender: UIButton) {
        if searchBar.isHidden {
            searchBar.isHidden = false
        } else {
            searchBar.isHidden = true
        }
    }
    
    @IBAction func toForecastViewController(_ sender: UIButton) {
        if let text = searchTextField.text {
            if text != "" {
                router?.openForecast(viewController: self, cityName: text)
            } else {
                router?.openForecast(viewController: self, cityName: "London")
            }
        }
    }
    
    @IBAction func tempChange(_ sender: UISegmentedControl) {
        switch segmentBar.selectedSegmentIndex {
        case 0:
            let request = ChangeWeatherTemperatureTypeUseCase.Request(tempType: .celcius)
            interactor?.changeTemp(request: request)
        case 1:
            let request = ChangeWeatherTemperatureTypeUseCase.Request(tempType: .farenheit)
            interactor?.changeTemp(request: request)
        default:
            break
        }
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = searchTextField.text {
            getWeather(cityName: text)
        }
        searchBar.isHidden = true

    }
    
}

//MARK: - IWeatherViewController

extension WeatherViewController: IWeatherViewController {
    func changeTemp(viewModel: ChangeWeatherTemperatureTypeUseCase.ViewModel) {
        tempLabel.text = viewModel.temperature
    }
    
    func showWeather(viewModel: GetWeatherCityNameUseCase.ViewModel) {
        
        let weatherViewModel = viewModel.weatherViewModel
        
        cityLabel.text = weatherViewModel.name
        dateLabel.text = weatherViewModel.date
        tempLabel.text = weatherViewModel.temp
        conditionLabel.text = weatherViewModel.conditionText
        humidityLabel.text = weatherViewModel.humidity
        conditionImageView.sd_setImage(with: weatherViewModel.conditionIcon, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
    }
    
    
}

//MARK: - Interactor

extension WeatherViewController {
    func getWeather(cityName: String) {
        let request = GetWeatherCityNameUseCase.Request(cityName: cityName)
        interactor?.getWeather(request: request)
    }
}

//
//  ViewController.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 30/6/2564 BE.
//

import UIKit
import SDWebImage

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
    
    let weatherAPI = WeatherAPIService(apiClient: APIClient())
    
    
    var weatherInfor: WeatherData?
//    var tempCheck = segmentBar
    var tempCheck = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        searchBar.isHidden = true
        callAPI(cityName: "London")
                
        // Do any additional setup after loading the view.
    }

    @IBAction func showSearchBar(_ sender: UIButton) {
        if searchBar.isHidden {
            searchBar.isHidden = false
        } else {
            searchBar.isHidden = true
        }
    }
    @IBAction func tempChange(_ sender: UISegmentedControl) {
        switch segmentBar.selectedSegmentIndex {
        case 0:
            print(segmentBar.selectedSegmentIndex)
            tempCheck = segmentBar.selectedSegmentIndex
            updateTempUI(tempCheck)
        case 1:
            print(segmentBar.selectedSegmentIndex)
            tempCheck = segmentBar.selectedSegmentIndex
            updateTempUI(tempCheck)
        default:
            break
        }
    }
    
    func callAPI(cityName: String) {
        weatherAPI.getWeather(city: cityName, completion: { [self] (result) in
                        switch result {
                        case .success(let weatherData):
                            DispatchQueue.main.async {
                                weatherInfor = weatherData
                                setupUI()
                                searchBar.isHidden = true
            
                            }
                        case .failure(let error):
                            print("retrive error on get Weather: \(error)")
                            DispatchQueue.main.async {
                                print("...")
                                
                            }
                        }
                    })
    }
    
    func setupUI() {
        if let weatherInfo = weatherInfor {
            
            let date = Date(timeIntervalSince1970: TimeInterval(weatherInfo.dt))
            let dateFormat = DateFormatter()
            dateFormat.timeZone = TimeZone(abbreviation: weatherInfo.sys.country) //Set timezone that you want
            dateFormat.locale = NSLocale.current
            dateFormat.dateFormat = "dd MMM yyyy"
            let strDate = dateFormat.string(from: date)
            
            let temp = weatherInfo.main.temp - Double(273.15)
            let temp2d = Double(round(10*temp)/10)
            
            let imageURL = "https://openweathermap.org/img/wn/\(weatherInfo.weather[0].icon)@2x.png"
            
            cityLabel.text = "\(weatherInfo.name), \(weatherInfo.sys.country)"
            dateLabel.text = strDate
            tempLabel.text = "\(String(temp2d)) °C"
            conditionLabel.text = weatherInfo.weather[0].main
            humidityLabel.text = "humidity: \(weatherInfo.main.humidity)%"
            conditionImageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
            
        } else {
            cityLabel.text = ""
            dateLabel.text = ""
            tempLabel.text = ""
            conditionLabel.text = ""
            conditionImageView.image = UIImage(systemName: "photo")
            
        }
    }
    
    func updateTempUI(_ tempCheck:Int) {
        if let weatherInfo = weatherInfor {
            let temp = weatherInfo.main.temp - Double(273.15)
            switch tempCheck {
            case 0:
                let temp2d = Double(round(10*temp)/10)
                
                tempLabel.text = "\(String(temp2d)) °C"
                
            case 1:
                let tempF = temp * Double(9/5) + Double(32)
                let temp2d = Double(round(10*tempF)/10)
                
                tempLabel.text = "\(String(temp2d)) °F"
//                (0K − 273.15) × 9/5 + 32 = -459.7°F
            default:
                break
            }
        }
    }
    
}

extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            textField.placeholder = "City"
            return true
        } else {
            textField.placeholder = "Type city name"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(searchTextField.text!)
        callAPI(cityName: searchTextField.text!)
        searchTextField.text = ""
    }
    
    
    
}

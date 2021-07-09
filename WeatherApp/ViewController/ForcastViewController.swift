//
//  ForcastViewController.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 30/6/2564 BE.
//

import UIKit

class ForcastViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let forecastAPI = WeatherAPIService(apiClient: APIClient())
    var forecastInfor: ForecastData?
    var dateForecasts: [DateForecastViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI(cityName: "Bangkok")
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func callAPI(cityName: String) {
        forecastAPI.getForecast(city: cityName, completion: { [self] (result) in
                        switch result {
                        case .success(let forecastData):
                            DispatchQueue.main.async {
                                forecastInfor = forecastData
                                setupUI()
                                tableView.reloadData()
                            }
                        case .failure(let error):
                            print("retrive error on get Forecast: \(error)")
                            DispatchQueue.main.async {
                                print("...")
                                
                            }
                        }
                    })
    }
    
    func setupUI() {
        
        if let forecastAPIList = forecastInfor {
            var timeForecasts: [TimeForecastViewModel] = []
            for item in forecastAPIList.list {
                timeForecasts.append(TimeForecastViewModel(dt: item.dt, icon: item.weather[0].icon, temp: item.main.temp))
            }
            for i in 0..<forecastAPIList.list.count {
                var isAdded = false
                let temp = DateForecastViewModel(dt: forecastAPIList.list[i].dt, timeForecast: timeForecasts)
                if i == 0 {
                    dateForecasts.append(temp)
                }
                for var day in dateForecasts {
                    if day.date == temp.date {
                        isAdded = true
                        day.timeForecasts.append(temp.timeForecasts[0])
                    }
                }

                if !isAdded {
                    dateForecasts.append(temp)
                }
                
            }
        } else {
            
        }
    }
    
    


}
extension ForcastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateForecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomViewCell
        
        let text = dateForecasts[indexPath.row].date
        let dateForecast = dateForecasts[indexPath.row].timeForecasts
        cell.timeForecasts = dateForecast
        cell.day.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}

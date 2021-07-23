//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 21/7/2564 BE.
//

import Foundation

struct WeatherViewModel {
    let name: String
    let date: String
    let temp: String
    let conditionText: String?
    let conditionIcon: URL?
    let humidity: String
    
    init(name: String, country: String, date: Int, temp: Double, conditionText: String?, conditionIcon: String?, humidity: Int, tempType: TempType) {
        let temperature = temp - 273.15
        let imageURL = "https://openweathermap.org/img/wn/\(conditionIcon ?? "")@2x.png"
        switch tempType {
        case .celcius:
            let tempCelcius = Double(round(10*temperature)/10)
            self.temp = "\(String(tempCelcius)) °C"
            
        case .farenheit:
            let tempF = temperature * Double(9/5) + Double(32)
            let tempFarenheit = Double(round(10*tempF)/10)
            self.temp = "\(String(tempFarenheit)) °F"
        }
        
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormat = DateFormatter()
        dateFormat.locale = NSLocale.current
        dateFormat.dateFormat = "dd MMM yyyy"
        self.date = dateFormat.string(from: date)
        
        self.name = "\(name), \(country)"
        self.conditionText = conditionText
        self.conditionIcon = URL(string: imageURL)
        self.humidity = "Humidity: \(humidity)%"
    }
    
}

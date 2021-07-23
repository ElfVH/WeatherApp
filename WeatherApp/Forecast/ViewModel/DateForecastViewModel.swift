//
//  DateForecastViewModel.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 7/7/2564 BE.
//

import Foundation

struct DateForecastViewModel {
    let date: String
    var timeForecasts: [TimeForecastViewModel]
    
    init(dt: Int, timeForecast: [TimeForecastViewModel]) {
        let dateFormat = DateFormatter()
        dateFormat.locale = NSLocale.current
        dateFormat.dateFormat = "EEEE"
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let strDate = dateFormat.string(from: date)
        var usedTimeForecast: [TimeForecastViewModel] = []
        
        self.date = strDate
        for item in timeForecast {
            if item.date == strDate {
                usedTimeForecast.append(item)
            }
        }
        self.timeForecasts = usedTimeForecast
    }
}

struct TimeForecastViewModel {
    var date: String?
    let time: String
    var image: URL?
    let temp: String
    
    init(dt: Int, icon: String, temp: Double) {
        let dateFormat = DateFormatter()
        let date2Format = DateFormatter()
        dateFormat.locale = NSLocale.current
        date2Format.locale = NSLocale.current
        dateFormat.dateFormat = "hh:mm a"
        date2Format.dateFormat = "EEEE"
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let strDate = dateFormat.string(from: date)
        let strDate2 = date2Format.string(from: date)
        
        let imageURL = "https://openweathermap.org/img/wn/\(icon)@2x.png"
         
        let temperature = temp - Double(273.15)
        let temp2d = Double(round(10*temperature)/10)
        
        time = strDate
        image = URL(string: imageURL)
        self.temp = String(temp2d)
        self.date = strDate2
        
    }
}


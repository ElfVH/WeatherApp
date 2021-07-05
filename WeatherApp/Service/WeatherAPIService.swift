//
//  WaetherAPIService.swift
//  WeatherApp
//
//  Created by Ittipong Kaewmahing on 5/7/2564 BE.
//

import Foundation

class WeatherAPIService {
	
	func getWeather(city: String, completion: (Result<AnyObject, Error>) -> Void) {
		// https://medium.com/@vialyx/ios-dev-course-json-codable-nsurlsession-repository-4072f85ce2e
		// Success
		completion(.success(NSObject()))
		
		// Fail
		//completion(.failure(error))
	}
}

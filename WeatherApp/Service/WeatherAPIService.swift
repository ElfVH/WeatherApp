//
//  WaetherAPIService.swift
//  WeatherApp
//
//  Created by Ittipong Kaewmahing on 5/7/2564 BE.
//

import Foundation

// TODO: - Move to the separated file GenericResult.swift
enum Result<T> {
    case success(T)
    case failure(Error)
}

enum APIClientError: Error {
    case noData
}


final class APIClient {
    
    func load(_ resource: Resource, result: @escaping ((Result<Data>) -> Void)) {
        let request = URLRequest(resource)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let `data` = data else {
                result(.failure(APIClientError.noData))
                return
            }
            if let `error` = error {
                result(.failure(error))
                return
            }
            result(.success(data))
        }
        task.resume()
    }
    
}


//MARK: - WeatherAPI
class WeatherAPIService {
    
    private let apiClient: APIClient!
        
    init(apiClient: APIClient) {
            self.apiClient = apiClient
    }
    
	
	func getWeather(city: String, completion: @escaping (Result<WeatherData>) -> Void) {
		//https://medium.com/@vialyx/ios-dev-course-json-codable-nsurlsession-repository-4072f85ce2e
        let url = "https://api.openweathermap.org/data/2.5/weather?appId=593c5de39f89b2f59a1136d853ec2883&q=\(city)"
        
        guard let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        guard let urlStringResource = URL(string: urlString) else {
            return
        }
        
        let resource = Resource(url: urlStringResource)
                apiClient.load(resource) { (result) in
                    switch result {
                    case .success(let data):
                        do {
                            let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                            completion(.success(weatherData))
                        } catch {
                            completion(.failure(error))
                        }
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
	}
    
    func getForecast(city: String, completion: @escaping (Result<ForecastData>) -> Void) {
        //https://medium.com/@vialyx/ios-dev-course-json-codable-nsurlsession-repository-4072f85ce2e
        let url = "https://api.openweathermap.org/data/2.5/forecast?appId=593c5de39f89b2f59a1136d853ec2883&q=\(city)"
        
        guard let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        guard let urlStringResource = URL(string: urlString) else {
            return
        }
        
        let resource = Resource(url: urlStringResource)
                apiClient.load(resource) { (result) in
                    switch result {
                    case .success(let data):
                        do {
                            let forecastData = try JSONDecoder().decode(ForecastData.self, from: data)
                            completion(.success(forecastData))
                        } catch {
                            completion(.failure(error))
                        }
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }

        }


}

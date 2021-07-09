//
//  URLRequestExtension.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 7/7/2564 BE.
//

import Foundation

// TODO: - Move to the separated file URLRequest+Resource.swift
extension URLRequest {
    
    init(_ resource: Resource) {
        self.init(url: resource.url)
        self.httpMethod = resource.method
    }
    
}

//
//  WeatherManager.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/02/03.
//

import Foundation
import CoreLocation
import Combine

class WeatherManager {
    func getCityWeather(cityName: String) -> AnyPublisher<WeatherData, Error> {
        let appid = "abc"
        let name = cityName.replacingOccurrences(of: " ", with: "%20")
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(name)&appid=\(appid)&units=metric"
        
        return APISccessPublisher
            .publish(url)
            .eraseToAnyPublisher()
    }
}

struct WeatherData: Codable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Codable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Codable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Codable {
        var temp: Double
        var feelsLike: Double
        var tempMin: Double
        var tempMax: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Codable {
        var speed: Double
        var deg: Double
    }
}

//extension WeatherData.MainResponse {
//    var feelsLike: Double { return feelsLike }
//    var tempMin: Double { return tempMin }
//    var tempMax: Double { return tempMax }
//}

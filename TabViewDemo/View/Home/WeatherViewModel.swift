//
//  WeatherViewModel.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/02/03.
//

import Foundation
import Combine
import SwiftUI

class WeatherViewModel: ObservableObject {
    let area: Area
    var weatherManager = WeatherManager()
    @Published var weather: WeatherData?
    @Published var weatherIcon: Image = Image(systemName: "cloud")
        
    
    private var disposables = Set<AnyCancellable>()
    
    init(area: Area) {
        self.area = area
    }
    
    func getWeather() {
        weatherManager.getCityWeather(cityName: area.name)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(_): break
                }
            }, receiveValue: { [weak self] data in
                self?.weather = data
                self?.setWeatherIcon()
            })
            .store(in: &disposables)
    }
    
    func setWeatherIcon() {
        if let main = weather?.weather[0].main {
            if main == "Clear" {
                weatherIcon = Image(systemName: "sun.max")
            } else if main == "Rain" {
                weatherIcon = Image(systemName: "cloud.rain")
            } else if main == "Clouds" {
                weatherIcon = Image(systemName: "cloud")
            } else if main == "Snow" {
                weatherIcon = Image(systemName: "snowflake")
            } else if main == "Extreme" {
                weatherIcon = Image(systemName: "tornado")
            } else if main == "Mist" {
                weatherIcon = Image(systemName: "aqi.medium")
            } else {
                
            }
        }
    }
}

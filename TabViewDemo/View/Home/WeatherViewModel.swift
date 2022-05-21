//
//  WeatherViewModel.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/02/03.
//

import Foundation
import Combine
import SwiftUI
import MapKit

class WeatherViewModel: ObservableObject {
  let area: Area
  var weatherManager = WeatherManager()
  @Published var weather: WeatherData?
  @Published var weatherIcon: Image = Image(systemName: "cloud")
  @Published var region = MKCoordinateRegion(
    center : CLLocationCoordinate2D(
      // 緯度経度
      latitude: 35.658584,
      longitude: 139.7454316
    ),
    latitudinalMeters: 10000.0, // 南北距離
    longitudinalMeters: 10000.0 // 東西距離
  )

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
        self?.region = MKCoordinateRegion(
          center: CLLocationCoordinate2D(
            latitude: data.coord.lat,
            longitude: data.coord.lon
            ),
          latitudinalMeters: 10000.0,
          longitudinalMeters: 10000.0
        )
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

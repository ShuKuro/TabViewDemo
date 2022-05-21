//
//  WeatherView.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/02/02.
//

import SwiftUI
import MapKit

struct WeatherView: View {
  let area: Area
  @StateObject var viewModel: WeatherViewModel

  init(area: Area) {
    self.area = area
    _viewModel = StateObject(wrappedValue: WeatherViewModel(area: area))
  }

  var body: some View {
    ZStack {
      VStack {
        HStack {
          Text("Today, \(Date().formatted(.dateTime.month().day().weekday()))")
            .font(.title)
          Spacer()
        }
        .padding()

        if let weather = viewModel.weather {
          HStack {
            Spacer()

            viewModel.weatherIcon
              .font(.largeTitle)

            Text("\(weather.main.feelsLike.roundDouble())°")
              .font(.largeTitle)
              .fontWeight(.bold)
              .padding()

            Spacer()

          }

          HStack {
            Text("Max:\(weather.main.tempMax.roundDouble())°")
            Text("Min:\(weather.main.tempMin.roundDouble())°")
          }
          .font(.body)

        } else {
          HStack {
            Spacer()
            Text("−")
            Text("−")
              .padding()
            Spacer()
          }
          .font(.largeTitle)

          HStack {
            Text("Max:-")
            Text("Min:-")
          }
          .font(.body)
        }

        Map(coordinateRegion: $viewModel.region)
      }

    }
    .onAppear {
      viewModel.getWeather()
    }
  }
}

struct WeatherView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherView(area: Area(id: 1, name: "Tokyo"))
  }
}

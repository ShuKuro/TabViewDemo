//
//  WeatherView.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/02/02.
//

import SwiftUI

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
                     Text("\(Date().formatted(.dateTime.month().day().weekday()))")
                        .font(.title)
                    Spacer()
                }
                .padding()
                
                if let weather = viewModel.weather {
                    HStack {
                    viewModel.weatherIcon
                        .font(.system(size: 100))
                        .frame(height: 100)

                    Spacer()
                    
                    Text(weather.main.feelsLike.roundDouble() + "°")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .padding()
                    }
                } else {
                    HStack {
                    viewModel.weatherIcon
                        .font(.system(size: 100))
                        .frame(height: 100)

                    Spacer()
                    
                    Text("10°")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .padding()
                    }
                }

                Spacer()
            }
            .padding()
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

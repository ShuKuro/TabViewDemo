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
                     Text("Today, \(Date().formatted(.dateTime.month().day().weekday()))")
                        .font(.title)
                    Spacer()
                }
                .padding()
                
                if let weather = viewModel.weather {
                    HStack {
                        Spacer()
                        
                        viewModel.weatherIcon
                            .font(.system(size: 80))
                            .frame(height: 80)
                        
                        Text("\(weather.main.feelsLike.roundDouble())°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                        
                    }
                    
                    HStack {
                        Text("Max:\(weather.main.tempMax.roundDouble())°")
                            .font(.system(size: 20))
                        Text("Min:\(weather.main.tempMin.roundDouble())°")
                            .font(.system(size: 20))
                    }
                    
                } else {
                    HStack {
                        Spacer()
                        
                        viewModel.weatherIcon
                            .font(.system(size: 80))
                            .frame(height: 80)
                        
                        Text("-10°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                    }
                    
                    HStack {
                        Text("Max:10°")
                            .font(.system(size: 20))
                        Text("Min:0°")
                            .font(.system(size: 20))
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

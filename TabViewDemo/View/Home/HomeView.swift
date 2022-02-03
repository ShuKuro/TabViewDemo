//
//  HomeView.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/01/26.
//

import SwiftUI

struct HomeView: View {
    @State var selectedIndex = 0
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderTab(selectedIndex: $selectedIndex, areas: viewModel.areaList)
                .padding(.top, 10)
            TabView(selection: $selectedIndex) {
                ForEach(viewModel.areaList.indices) { index in
                    WeatherView(area: viewModel.areaList[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onChange(of: selectedIndex) { selection in
                // タブ切り替え時の処理
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

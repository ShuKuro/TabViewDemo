//
//  HomeViewModel.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/02/02.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    // TODO: get from weather api
    @Published var areaList: [Area] = []
    
    init() {
        areaList = [
            Area(id: 0, name: "Tokyo"),
            Area(id: 1, name: "New York"),
            Area(id: 2, name: "London"),
            Area(id: 3, name: "Kyoto")
        ]
    }
}

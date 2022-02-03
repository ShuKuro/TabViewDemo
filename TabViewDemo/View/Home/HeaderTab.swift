//
//  HeaderTab.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/01/28.
//

import SwiftUI

struct HeaderTab: View {
    @Binding var selectedIndex: Int
    var areas: [Area]
    
    init(selectedIndex: Binding<Int>, areas: [Area]) {
        _selectedIndex = selectedIndex
        self.areas = areas
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            ForEach(areas.indices) { index in
                header(index: index, title: areas[index].name)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .animation(.easeOut(duration: 0.2), value: selectedIndex)
    }
    
    @ViewBuilder
    func header(index: Int, title: String) -> some View {
        if selectedIndex == index {
            Text(title)
                .highlighted()
        } else {
            Text(title)
                .unhighlighted()
                .onTapGesture {
                    withAnimation {
                        selectedIndex = index
                    }
                }
        }
    }
}

struct HeaderTab_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTab(selectedIndex: .constant(0), areas: [])
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}

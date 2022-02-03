//
//  SettingView.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/01/26.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            ForEach(0..<10) { index in
                Text("\(index): item")
            }
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

//
//  SecondView.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/04/30.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
      ZStack {
        CategoriesView()
      }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

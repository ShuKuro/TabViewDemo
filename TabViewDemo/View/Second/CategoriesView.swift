//
//  CategoriesView.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/04/30.
//

import SwiftUI

var tabs = ["All", "Indoor", "Outdoor", "Garden"]


struct CategoriesView: View {
  @State var selectedTab = tabs[0]
  @Namespace var namespace
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(tabs, id: \.self) { tab in
          CategoryButton(text: tab, selected: $selectedTab, namespace: namespace)
        }
      }
      .padding(.vertical, 24)
    }
  }
}

struct CategoryButton: View {
  var text: String
  @Binding var selected: String
  var namespace: Namespace.ID

  var body: some View {
    Button(action: {
      withAnimation(.spring(), {
        selected = text
      })
    }) {
      Text(text)
      .fontWeight(.medium)
      .foregroundColor(selected == text ? .white : .black)
      .padding()
      .padding(.horizontal)
      .background(ZStack {
        if selected == text {
          Color("Primary")
            .cornerRadius(12)
            .matchedGeometryEffect(id: "TabButton", in: namespace)
        } else {

        }
      })

      .shadow(color: .black.opacity(0.16), radius: 16, x: 4, y: 4)
    }

  }
}



struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}

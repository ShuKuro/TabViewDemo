//
//  ContentView.swift
//  TabViewDemo
//
//  Created by shuhei.kuroda on 2022/01/26.
//

import SwiftUI

struct ContentView: View {
  @State private var tabSelection = 0
  @State private var tappedTwice = false
  @State private var home = UUID()
  @State private var second = UUID()
  @State private var bookmark = UUID()

  var handler: Binding<Int> { Binding(
    get: { self.tabSelection },
    set: {
      if $0 == self.tabSelection {
        //選択中のタブをタップした時
        tappedTwice = true
      }
      self.tabSelection = $0
    }
  )}

  var body: some View {

    TabView(selection: handler) {
      NavigationView {
        HomeView()
          .navigationTitle("Weather")
          .navigationBarTitleDisplayMode(.inline)
        //                    .navigationBarColor(backgroundColor: UIColor(named: "Base")!, tintColor: .white)
          .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
              leftButton
            }
            ToolbarItem(placement: .navigationBarTrailing) {
              rightButton
            }
          }
      }
      .tabItem {
        Label("Home", systemImage: "house")
      }
      .tag(0)
      .id(home)
      .onChange(of: tappedTwice, perform: { tappedTwice in
        guard tappedTwice else { return }
        home = UUID()
        self.tappedTwice = false
      })

      SecondView()
        .tabItem {
          Label("Second", systemImage: "house.fill")
        }
        .tag(1)
        .id(second)

      SettingView()
        .tabItem {
          Label("Setting", systemImage: "gearshape")
        }
        .tag(2)
        .id(bookmark)
    }
    .accentColor(.cyan)
  }

  var leftButton: some View {
    Button(action: {
      print("left tapped.")
    }) {
      Image(systemName: "line.3.horizontal")
    }
  }

  var rightButton: some View {
    Button(action: {
      print("right tapped.")
    }) {
      Image(systemName: "star.fill")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct NavigationBarColor: ViewModifier {
  init(backgroundColor: UIColor, tintColor: UIColor) {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.backgroundColor = backgroundColor
    coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = tintColor
  }

  func body(content: Content) -> some View {
    content
  }
}

extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}

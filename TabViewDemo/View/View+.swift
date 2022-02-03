//
//  View+.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/02/01.
//

import SwiftUI

struct HighlightedTabItem: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background(Color.cyan)
            .cornerRadius(20)
    }
}

struct UnhighlightedTabItem: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .padding(.horizontal)
            .padding(.vertical, 4)
    }
}

extension View {
    func highlighted() -> some View {
        self.modifier(HighlightedTabItem())
    }
    
    func unhighlighted() -> some View {
        self.modifier(UnhighlightedTabItem())
    }
}

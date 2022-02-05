//
//  Extensions.swift
//  TabViewDemo
//
//  Created by Shuhei Kuroda on 2022/02/03.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension Calendar {
    // MARK: - Components

    static func year(of date: Date) -> Int {
        let calendar = Calendar(identifier: .gregorian) // グレゴリオ歴
        return calendar.component(.year, from: date)
    }

    static func month(of date: Date) -> Int {
        Calendar.current.component(.month, from: date)
    }

    static func day(of date: Date) -> Int {
        Calendar.current.component(.day, from: date)
    }

    static func hour(of date: Date) -> Int {
        Calendar.current.component(.day, from: date)
    }

    static func minute(of date: Date) -> Int {
        Calendar.current.component(.minute, from: date)
    }

    static func second(of date: Date) -> Int {
        Calendar.current.component(.second, from: date)
    }
}


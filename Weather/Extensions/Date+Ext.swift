//
//  Date+Ext.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 20/5/2024.
//

import Foundation

extension Date {
    func hhmm() -> String {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.dateFormat = "HH : mm"
        return df.string(from: self)
    }
}

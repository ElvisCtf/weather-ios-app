//
//  Suffix.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 27/6/2024.
//

import Foundation

@propertyWrapper
struct Suffix<T> {
    var wrappedValue: T
    private let suffix: String
    
    var projectedValue: String {
        "\(wrappedValue) \(suffix)"
    }
    
    init(wrappedValue: T, _ suffix: String) {
        self.wrappedValue = wrappedValue
        self.suffix = suffix
    }
}

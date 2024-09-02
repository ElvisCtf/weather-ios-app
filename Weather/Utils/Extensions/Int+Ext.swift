//
//  Int+Ext.swift
//  Weather
//
//  Created by Elvis Cheng on 7/6/2024.
//

import Foundation

extension Int? {
    var safe: Int {
        return self ?? 0
    }
}

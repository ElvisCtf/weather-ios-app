//
//  String+Ext.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 7/6/2024.
//

import Foundation

extension String? {
    var safe: String {
        return self ?? ""
    }
}

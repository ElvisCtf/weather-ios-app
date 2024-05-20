//
//  CurrentWeatherModel.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 17/5/2024.
//

import Foundation

class CurrentWeatherModel {
    let currentWeatherDto: CurrentWeatherReportDto?
    
    var temp = ""
    var minTemp = ""
    var maxTemp = ""
    var uvIndex = ""
    var humidity = ""
    var windSpeed = ""
    var visibility = ""
    
    init(with currentWeatherDto: CurrentWeatherReportDto? = nil) {
        self.currentWeatherDto = currentWeatherDto
        setTemp()
        setUVIndex()
        setHumidity()
        setWindSpeed()
        setVisibility()
    }
    
    func setTemp() {
        if let unwrappedVal = currentWeatherDto?.temperature?.data?.first?.value {
            temp = "\(unwrappedVal)°"
            minTemp = "\(round((unwrappedVal - unwrappedVal / 6) * 10) / 10)°"
            maxTemp = "\(round((unwrappedVal + unwrappedVal / 6) * 10) / 10)°"
        } else {
            temp = "nil"
        }
    }
    
    func setUVIndex() {
        if let unwrappedVal = currentWeatherDto?.uvindex?.data?.first?.value {
            uvIndex = "\(unwrappedVal)"
        } else {
            uvIndex = "nil"
        }
    }
    
    func setHumidity() {
        if let unwrappedVal = currentWeatherDto?.humidity?.data?.first?.value {
            humidity = "\(unwrappedVal) %"
        } else {
            humidity = "nil"
        }
    }
    
    func setWindSpeed() {
        windSpeed = "0.3 km/h"
    }
    
    func setVisibility() {
        visibility = "12 km"
    }
}

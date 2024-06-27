//
//  CurrentWeatherModel.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 17/5/2024.
//

import Foundation

class CurrentWeatherModel {
    let currentWeatherDto: CurrentWeatherReportResponseDto?
    
    @Suffix("°")    var test = "monke"
    
    @Suffix("°")    var temp = 0.0
    @Suffix("°")    var minTemp = 0.0
    @Suffix("°")    var maxTemp = 0.0
    
    @Suffix("°")    var uvIndex = 0
    @Suffix("%")    var humidity = 0.0
    @Suffix("km/h") var windSpeed = 0.0
    @Suffix("km")   var visibility = 0.0
    
    var updateTime = ""
    var icon = ""
    
    var tempRange: String {
        return "\($maxTemp) / \($minTemp)"
    }
    
    init(with currentWeatherDto: CurrentWeatherReportResponseDto? = nil) {
        self.currentWeatherDto = currentWeatherDto
        setTemp()
        setUVIndex()
        setHumidity()
        setWindSpeed()
        setVisibility()
        setUpdateTime()
        setIcon()
    }
    
    func setTemp() {
        if let unwrappedVal = currentWeatherDto?.temperature?.data?.first?.value {
            temp = unwrappedVal
            minTemp = round(((unwrappedVal - unwrappedVal / 6) * 10) / 10)
            maxTemp = round(((unwrappedVal + unwrappedVal / 6) * 10) / 10)
        }
    }
    
    func setUVIndex() {
        if let unwrappedVal = currentWeatherDto?.uvindex?.data?.first?.value {
            uvIndex = Int(unwrappedVal)
        }
    }
    
    func setHumidity() {
        if let unwrappedVal = currentWeatherDto?.humidity?.data?.first?.value {
            humidity = unwrappedVal
        }
    }
    
    func setWindSpeed() {
        windSpeed = 15
    }
    
    func setVisibility() {
        visibility = 9
    }
    
    func setUpdateTime() {
        if let unwrappedVal = currentWeatherDto?.updateTime?.hhmm() {
            updateTime = "Last updated at \(unwrappedVal)"
        } else {
            updateTime = "nil"
        }
    }
    
    func setIcon() {
        if let unwrappedVal = currentWeatherDto?.icon?.first {
            icon = Constants.iconDict[unwrappedVal] ?? "cloud.sun"
        } else {
            icon = "cloud.sun"
        }
    }
}

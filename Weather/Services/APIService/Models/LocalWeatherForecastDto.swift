//
//  LocalWeatherForecastDto.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 20/5/2024.
//

import Foundation

// MARK: - LocalWeatherForecastDto
struct LocalWeatherForecastDto: Codable {
    let generalSituation, tcInfo, fireDangerWarning, forecastPeriod: String?
    let forecastDesc, outlook: String?
    let updateTime: Date?
}


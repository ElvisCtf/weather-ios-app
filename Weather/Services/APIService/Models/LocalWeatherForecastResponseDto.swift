//
//  LocalWeatherForecastDto.swift
//  Weather
//
//  Created by Elvis Cheng on 20/5/2024.
//

import Foundation

// MARK: - LocalWeatherForecastDto
struct LocalWeatherForecastResponseDto: Codable {
    let generalSituation, tcInfo, fireDangerWarning, forecastPeriod: String?
    let forecastDesc, outlook: String?
    let updateTime: Date?
}


//
//  NineDaysForecastResponseDto.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 7/6/2024.
//

import Foundation

// MARK: - NineDaysForecastResponseDto
struct NineDaysForecastResponseDto: Codable {
    let generalSituation: String?
    let weatherForecast: [WeatherForecast]?
    let updateTime: Date?
    let seaTemp: Temp?
    let soilTemp: [Temp]?
}

// MARK: - Temp
struct Temp: Codable {
    let place: String?
    let value: Float?
    let unit: Unit?
    let recordTime: Date?
    let depth: Depth?
}

// MARK: - Depth
struct Depth: Codable {
    let unit: Unit?
    let value: Float?
}

enum Unit: String, Codable {
    case c = "C"
    case metre = "metre"
    case percent = "percent"
}

// MARK: - WeatherForecast
struct WeatherForecast: Codable {
    let forecastDate, week, forecastWind, forecastWeather: String?
    let forecastMaxtemp, forecastMintemp, forecastMaxrh, forecastMinrh: Depth?
    let forecastIcon: Int?
    let psr: String?

    enum CodingKeys: String, CodingKey {
        case forecastDate, week, forecastWind, forecastWeather, forecastMaxtemp, forecastMintemp, forecastMaxrh, forecastMinrh
        case forecastIcon = "ForecastIcon"
        case psr = "PSR"
    }
}

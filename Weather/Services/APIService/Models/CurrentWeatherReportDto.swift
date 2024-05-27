//
//  CurrentWeatherReportDto.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 17/5/2024.
//

import Foundation


struct CurrentWeatherReportDto: Codable {
    let rainfall: Rainfall?
    let icon: [Int]?
    let iconUpdateTime: Date?
    let uvindex: Uvindex?
    let updateTime: Date?
    let temperature: Humidity?
    let warningMessage, mintempFrom00To09, rainfallFrom00To12, rainfallLastMonth: String?
    let rainfallJanuaryToLastMonth: String?
    let tcmessage: [String]?
    let humidity: Humidity?
}

// MARK: - Humidity
struct Humidity: Codable {
    let recordTime: Date?
    let data: [HumidityDatum]?
}

// MARK: - HumidityDatum
struct HumidityDatum: Codable {
    let unit: PurpleUnit?
    let value: Float?
    let place: String?
}

enum PurpleUnit: String, Codable {
    case c = "C"
    case percent = "percent"
}

// MARK: - Rainfall
struct Rainfall: Codable {
    let data: [RainfallDatum]?
    let startTime, endTime: Date?
}

// MARK: - RainfallDatum
struct RainfallDatum: Codable {
    let unit: FluffyUnit?
    let place: String?
    let max: Float?
    let main: Main?
}

enum Main: String, Codable {
    case mainFALSE = "FALSE"
}

enum FluffyUnit: String, Codable {
    case mm = "mm"
}

// MARK: - Uvindex
struct Uvindex: Codable {
    let data: [UvindexDatum]?
    let recordDesc: String?
}

// MARK: - UvindexDatum
struct UvindexDatum: Codable {
    let place: String?
    let value: Float?
    let desc: String?
}

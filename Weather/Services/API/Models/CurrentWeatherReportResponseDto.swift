//
//  CurrentWeatherReportResponseDto.swift
//  Weather
//
//  Created by Elvis Cheng on 17/5/2024.
//

import Foundation


struct CurrentWeatherReportResponseDto: Codable {
    let rainfall: Rainfall?
    let icon: [Int]?
    let iconUpdateTime: Date?
    let uvindex: Uvindex?
    let updateTime: Date?
    let temperature: Humidity?
    let warningMessage: Message?
    let mintempFrom00To09, rainfallFrom00To12, rainfallLastMonth: String?
    let rainfallJanuaryToLastMonth: String?
    let tcmessage: Message?
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
    let value: Double?
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
    let max: Double?
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
    let value: Double?
    let desc: String?
}

// MARK: - UvindexDatum
struct Message: Codable {
    let message: String
    let messages: [String]
    
    init(from decoder: Decoder) throws {
        let container =  try decoder.singleValueContainer()
        do {
            message = try container.decode(String.self)
            messages = [String]()
        } catch {
            messages = try container.decode([String].self)
            message = ""
        }
    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        //try isEdited ? container.encode(editedTime) : container.encode(false)
//    }
}

//
//  NineDaysForecastModel.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 7/6/2024.
//

import Foundation

struct DayForecast: Identifiable {
    var id = UUID()
    let weekday: String
    let iconImage: String
    @Suffix("°") var minTemp = 0
    @Suffix("°") var maxTemp = 0
    @Suffix("%") var minHumid = 0
    @Suffix("%") var maxHumid = 0
}

class NineDaysForecastModel {
    var list = [DayForecast]()
    
    init(with dto: NineDaysForecastResponseDto? = nil) {
        self.list = buildForecastList(dto)
    }
    
    func buildForecastList(_ dto: NineDaysForecastResponseDto?) -> [DayForecast] {
        var result = [DayForecast]()
        
        if let weatherForecast = dto?.weatherForecast {
            for item in weatherForecast {
                let weekday = String(item.week.safe.prefix(3))
                let iconImage = Constants.iconDict[item.forecastIcon ?? 0] ?? "sun.max"
                let minTemp = Int(item.forecastMintemp?.value ?? 0.0)
                let maxTemp = Int(item.forecastMaxtemp?.value ?? 0.0)
                let minHumid = Int(item.forecastMinrh?.value ?? 0.0)
                let maxHumid = Int(item.forecastMaxrh?.value ?? 0.0)
                result.append(DayForecast(weekday: weekday, iconImage: iconImage, minTemp: minTemp, maxTemp: maxTemp, minHumid: minHumid, maxHumid: maxHumid))
            }
        }
        
        return result
    }
}


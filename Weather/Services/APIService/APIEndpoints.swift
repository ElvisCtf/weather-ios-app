//
//  APIEndpoints.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 17/5/2024.
//

import Foundation

struct APIEndpoints {
    static let localWeatherForecast = "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=flw&lang=en"
    static let currentWeatherReport = "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=rhrread&lang=en"
    static let nineDaysForecast = "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=fnd&lang=en"
}

//
//  Repository.swift
//  Weather
//
//  Created by Elvis Cheng on 20/5/2024.
//

final class Repository {
    static let shared = Repository()
    private let apiService = WeatherAPIService()
    weak var delegate: WeatherAPIProtocol?
    
    private init() {
        delegate = apiService
    }
    
    func getCurrentWeatherReport() async -> CurrentWeatherReportResponseDto? {
        await delegate?.getCurrentWeatherReport()
    }
    
    func getLocalWeatherForecast() async -> LocalWeatherForecastResponseDto? {
        await delegate?.getLocalWeatherForecast()
    }
    
    func getNineDaysForecast() async -> NineDaysForecastResponseDto? {
        await delegate?.getNineDaysForecast()
    }
}

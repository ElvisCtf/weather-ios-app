//
//  WeatherAPIService.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 11/11/2024.
//

final class WeatherAPIService: WeatherAPIProtocol {
    func getCurrentWeatherReport() async -> CurrentWeatherReportResponseDto? {
        do {
            let dto = try await NetworkManager.shared.request(method: .get, url: APIEndpoints.currentWeatherReport, of: CurrentWeatherReportResponseDto.self)
            return dto
        } catch {
            print("[‼️] \(#function) \(String(describing: error))")
            return nil
        }
    }
    
    func getLocalWeatherForecast() async -> LocalWeatherForecastResponseDto? {
        do {
            let dto = try await NetworkManager.shared.request(method: .get, url: APIEndpoints.localWeatherForecast, of: LocalWeatherForecastResponseDto.self)
            return dto
        } catch {
            print("[‼️] \(#function) \(String(describing: error))")
            return nil
        }
    }
    
    func getNineDaysForecast() async -> NineDaysForecastResponseDto? {
        do {
            let dto = try await NetworkManager.shared.request(method: .get, url: APIEndpoints.nineDaysForecast, of: NineDaysForecastResponseDto.self)
            return dto
        } catch {
            print("[‼️] \(#function) \(String(describing: error))")
            return nil
        }
    }
}


protocol WeatherAPIProtocol: AnyObject {
    func getCurrentWeatherReport() async -> CurrentWeatherReportResponseDto?
    func getLocalWeatherForecast() async -> LocalWeatherForecastResponseDto?
    func getNineDaysForecast() async -> NineDaysForecastResponseDto?
}

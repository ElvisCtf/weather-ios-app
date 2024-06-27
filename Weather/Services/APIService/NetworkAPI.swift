//
//  NetworkAPI.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 20/5/2024.
//

import Foundation


class NetworkAPI {
    static func getCurrentWeatherReport() async -> CurrentWeatherReportResponseDto? {
        do {
            let dto = try await NetworkManager.shared.request(method: .get, url: APIEndpoints.currentWeatherReport, of: CurrentWeatherReportResponseDto.self)
            return dto
        } catch {
            print("[‼️] getCurrentWeatherReport() \(String(describing: error))")
            return nil
        }
    }
    
    static func getLocalWeatherForecast() async -> LocalWeatherForecastResponseDto? {
        do {
            let dto = try await NetworkManager.shared.request(method: .get, url: APIEndpoints.localWeatherForecast, of: LocalWeatherForecastResponseDto.self)
            return dto
        } catch {
            print("[‼️] getLocalWeatherForecast() \(String(describing: error))")
            return nil
        }
    }
    
    static func getNineDaysForecast() async -> NineDaysForecastResponseDto? {
        do {
            let dto = try await NetworkManager.shared.request(method: .get, url: APIEndpoints.nineDaysForecast, of: NineDaysForecastResponseDto.self)
            return dto
        } catch {
            print("[‼️] getNineDaysForecast() \(String(describing: error))")
            return nil
        }
    }
}

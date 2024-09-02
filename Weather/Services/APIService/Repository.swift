//
//  Repository.swift
//  Weather
//
//  Created by Elvis Cheng on 20/5/2024.
//

final class Repository {
    static let shared = Repository()
    
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

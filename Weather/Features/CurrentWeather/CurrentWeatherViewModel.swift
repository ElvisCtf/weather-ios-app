//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 17/5/2024.
//

import Foundation
import SwiftUI

final class CurrentWeatherViewModel: ObservableObject {
    @MainActor @Published var currentWeatherModel = CurrentWeatherModel()
    @MainActor @Published var nineDaysForecastModel = NineDaysForecastModel()
    @MainActor @Published var errorMessage = ""
    
    var bgColor: AnyGradient {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour >= 18 ? Color.black.gradient : Color.teal.gradient
    }
 
    init() {}
    
    func getCurrentWeather() async {
        await MainActor.run {
            self.errorMessage = ""
        }
        
        if let dto = await NetworkAPI.getCurrentWeatherReport() {
            await MainActor.run {
                self.currentWeatherModel = CurrentWeatherModel(with: dto)
            }
        } else {
            await MainActor.run {
                self.errorMessage = "Fetch data failed"
            }
        }
    }
    
    func getNineDaysForecast() async {
        await MainActor.run {
            self.errorMessage = ""
        }
        
        if let dto = await NetworkAPI.getNineDaysForecast() {
            await MainActor.run {
                self.nineDaysForecastModel = NineDaysForecastModel(with: dto)
            }
        } else {
            await MainActor.run {
                self.errorMessage = "Fetch data failed"
            }
        }
    }
}

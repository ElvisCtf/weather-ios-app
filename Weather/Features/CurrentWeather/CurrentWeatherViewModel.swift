//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 17/5/2024.
//

import SwiftUI

@Observable
final class CurrentWeatherViewModel: ObservableObject {
    var currentWeatherModel = CurrentWeatherModel()
    var nineDaysForecastModel = NineDaysForecastModel()
    var errorMessage = ""
    
    var bgColor: AnyGradient {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour >= 18 ? Color.black.gradient : Color.teal.gradient
    }
    
    func getCurrentWeather() async {
        self.errorMessage = ""
        
        if let dto = await Repository.shared.getCurrentWeatherReport() {
            self.currentWeatherModel = CurrentWeatherModel(with: dto)
        } else {
            self.errorMessage = "Fetch data failed"
        }
    }
    
    func getNineDaysForecast() async {
        self.errorMessage = ""
        
        if let dto = await Repository.shared.getNineDaysForecast() {
            self.nineDaysForecastModel = NineDaysForecastModel(with: dto)
        } else {
            self.errorMessage = "Fetch data failed"
        }
    }
}

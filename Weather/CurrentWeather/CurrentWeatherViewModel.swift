//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 17/5/2024.
//

import Foundation


class CurrentWeatherViewModel: ObservableObject {
    @MainActor @Published var currentWeatherModel = CurrentWeatherModel()
    @MainActor @Published var errorMessage = ""
    
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
}

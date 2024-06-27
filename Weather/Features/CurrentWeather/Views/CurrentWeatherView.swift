//
//  ContentView.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 16/5/2024.
//

import SwiftUI

struct CurrentWeatherView: View {
    @StateObject var viewmodel = CurrentWeatherViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    generalWeatherInfoView
                    weatherIconView
                }
                .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                
                weatherParameterGridView
                
                nineDayForecastListView
            }
            
        }
        .clipShape(Rectangle())
        .background(.teal.gradient)
        .onAppear {
            Task {
                await viewmodel.getCurrentWeather()
                await viewmodel.getNineDaysForecast()
            }
        }
    }
}

// MARK: Subviews
extension CurrentWeatherView {
    var generalWeatherInfoView: some View {
        VStack(spacing: 6) {
            Text(viewmodel.currentWeatherModel.temp)
                .font(.system(size: 72, weight: .light))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Sunny")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
            
            Text("Hong Kong")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text(viewmodel.currentWeatherModel.tempRange)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(viewmodel.currentWeatherModel.updateTime)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    
    var weatherParameterGridView: some View {
        Grid(horizontalSpacing: 14, verticalSpacing: 14) {
            GridRow {
                BasicCardView(
                    title: "UV INDEX",
                    content: viewmodel.currentWeatherModel.uvIndex,
                    icon: "sun.max"
                )
                
                BasicCardView(
                    title: "HUMIDITY",
                    content: viewmodel.currentWeatherModel.humidity,
                    icon: "drop"
                )
            }
            
            GridRow {
                BasicCardView(
                    title: "WIND SPEED",
                    content: viewmodel.currentWeatherModel.windSpeed,
                    icon: "wind"
                )
                
                BasicCardView(
                    title: "VISIBILITY",
                    content: viewmodel.currentWeatherModel.visibility,
                    icon: "eye"
                )
            }
        }
        .padding(16)
    }
    
    
    var nineDayForecastListView: some View {
        GroupBox() {
            VStack {
                ForEach(viewmodel.nineDaysForecastModel.list) { item in
                    WeatherForecastCellView(
                        weekday: item.weekday,
                        iconImage: item.iconImage,
                        minTemp: item.minTemp,
                        maxTemp: item.maxTemp,
                        minHumid: item.minHumid,
                        maxHumid: item.maxHumid
                    )
                }
            }
        } label: {
            VStack {
                Label("9-DAY FORECAST", systemImage: "calendar")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.white)
                    .imageScale(.large)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .frame(minHeight: 1)
                    .overlay(.white)
            }
        }
        .backgroundStyle(.indigo.opacity(0.3))
        .padding(16)
    }
    
    
    var weatherIconView: some View {
        Image(systemName: viewmodel.currentWeatherModel.icon)
            .resizable()
            .scaledToFit()
            .font(Font.title.weight(.light))
            .foregroundColor(.white)
            .frame(width: 110, alignment: .leading)
            .padding(24)
    }
}

#Preview {
    CurrentWeatherView()
}

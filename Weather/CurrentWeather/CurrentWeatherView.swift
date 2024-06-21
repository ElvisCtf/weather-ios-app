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
                    
                    Image(systemName: viewmodel.currentWeatherModel.icon)
                        .resizable()
                        .scaledToFit()
                        .font(Font.title.weight(.light))
                        .foregroundColor(.white)
                        .frame(width: 110, alignment: .leading)
                        .padding(24)
                }
                .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                
                
                
                Grid(horizontalSpacing: 14, verticalSpacing: 14) {
                    GridRow {
                        GroupBox() {
                            Text(viewmodel.currentWeatherModel.uvIndex)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(1)
                        } label: {
                            Label("UV INDEX", systemImage: "sun.max")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.white)
                                .imageScale(.large)
                        }.backgroundStyle(.indigo.opacity(0.3))
                        
                        GroupBox() {
                            Text(viewmodel.currentWeatherModel.humidity)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(1)
                        } label: {
                            Label("HUMIDITY", systemImage: "drop")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.white)
                                .imageScale(.large)
                        }.backgroundStyle(.indigo.opacity(0.3))
                    }
                    
                    GridRow {
                        GroupBox() {
                            Text("0.2 km/h")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(1)
                        } label: {
                            Label("WIND", systemImage: "wind")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.white)
                                .imageScale(.large)
                        }.backgroundStyle(.indigo.opacity(0.3))
                        
                        GroupBox() {
                            Text("12 km")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(1)
                        } label: {
                            Label("VISIBILITY", systemImage: "eye")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.white)
                                .imageScale(.large)
                        }.backgroundStyle(.indigo.opacity(0.3))
                    }
                }
                .padding(16)
                
                
                
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
            
        }
        .background(.teal.gradient)
        .onAppear {
            Task {
                await viewmodel.getCurrentWeather()
                await viewmodel.getNineDaysForecast()
            }
        }
        
        
    }
}

#Preview {
    CurrentWeatherView()
}

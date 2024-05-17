//
//  ContentView.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 16/5/2024.
//

import SwiftUI

struct CurrentWeatherView: View {
    var body: some View {
        VStack(spacing: 16) {
            
            Label("Hong Kong", systemImage: "location.circle")
                .font(.system(size: 24, weight: .medium))
            
            VStack(spacing: 10) {
                Image(systemName: "cloud.sun")
                    .resizable()
                    .scaledToFit()
                    .font(Font.title.weight(.light))
                    .frame(width: 100)
                
                VStack() {
                    Text("25°C")
                        .font(.system(size: 72, weight: .light))
                    
                    HStack(spacing: 36) {
                        Label("22°C", systemImage: "thermometer.low")
                            .font(.system(size: 18, weight: .regular))
                            .imageScale(.large)
                        
                        Label("30°C", systemImage: "thermometer.high")
                            .font(.system(size: 18, weight: .regular))
                            .imageScale(.large)
                    }
                }
                
                Text("Sunny")
                    .font(.system(size: 18, weight: .medium))
                
                Text("Last updated: 15:27")
                    .font(.system(size: 12, weight: .light))
            }
            
            Grid(horizontalSpacing: 14, verticalSpacing: 14) {
                GridRow {
                    GroupBox() {
                        Text("8")
                            .font(.system(size: 18, weight: .bold))
                            .padding(1)
                    } label: {
                        Label("UV INDEX", systemImage: "sun.max")
                            .font(.system(size: 14, weight: .medium))
                            .imageScale(.large)
                    }
                    
                    GroupBox() {
                        Text("60 %")
                            .font(.system(size: 18, weight: .bold))
                            .padding(1)
                    } label: {
                        Label("HUMIDILITY", systemImage: "drop")
                            .font(.system(size: 14, weight: .medium))
                            .imageScale(.large)
                    }
                }
                
                GridRow {
                    GroupBox() {
                        Text("0.2 km/h")
                            .font(.system(size: 18, weight: .bold))
                            .padding(1)
                    } label: {
                        Label("WIND", systemImage: "wind")
                            .font(.system(size: 14, weight: .medium))
                            .imageScale(.large)
                    }
                    
                    GroupBox() {
                        Text("12 km")
                            .font(.system(size: 18, weight: .bold))
                            .padding(1)
                    } label: {
                        Label("VISIBILITY", systemImage: "eye")
                            .font(.system(size: 14, weight: .medium))
                            .imageScale(.large)
                    }
                }
            }
            .padding()
        }
        
        
        
        Spacer()
    }
}

#Preview {
    CurrentWeatherView()
}

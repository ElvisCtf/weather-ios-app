//
//  WeatherForecastCellView.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 27/5/2024.
//

import SwiftUI

struct WeatherForecastCellView: View {
    var body: some View {
        HStack {
            Text("TUE")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
            
            Spacer()
            
            Image(systemName: "cloud.fill")
                .resizable()
                .scaledToFit()
                .font(Font.title.weight(.light))
                .foregroundColor(.white)
                .frame(width: 24, alignment: .leading)
            
            Spacer().frame(width: 42)
            
            Image(systemName: "drop.degreesign.fill")
                .resizable()
                .scaledToFit()
                .font(Font.title.weight(.light))
                .foregroundColor(.white)
                .frame(height: 14, alignment: .leading)
            
            Text("65%")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
            
            Spacer().frame(width: 36)
            
            Image(systemName: "thermometer.high")
                .resizable()
                .scaledToFit()
                .font(Font.title.weight(.light))
                .foregroundColor(.white)
                .frame(height: 14, alignment: .leading)
            
            Text("25°")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
            
            Text("32°")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
    }
}

#Preview {
    WeatherForecastCellView()
}

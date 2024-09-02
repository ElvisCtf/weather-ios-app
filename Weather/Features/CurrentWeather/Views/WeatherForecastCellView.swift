//
//  WeatherForecastCellView.swift
//  Weather
//
//  Created by Elvis Cheng on 27/5/2024.
//

import SwiftUI

struct WeatherForecastCellView: View {
    let weekday: String
    let iconImage: String
    let minTemp, maxTemp: String
    let minHumid, maxHumid: String
    
    var body: some View {
        HStack() {
            Text(weekday)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
            
            Spacer()
            
            Image(systemName: iconImage)
                .resizable()
                .scaledToFit()
                .font(Font.title.weight(.light))
                .foregroundColor(.white)
                .frame(height: 24, alignment: .leading)
            
            Spacer().frame(width: 42)
            
            Image(systemName: "drop.degreesign.fill")
                .resizable()
                .scaledToFit()
                .font(Font.title.weight(.light))
                .foregroundColor(.white)
                .frame(height: 14, alignment: .leading)
            
            Text(maxHumid)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
            
            Spacer().frame(width: 36)
            
            Image(systemName: "thermometer.high")
                .resizable()
                .scaledToFit()
                .font(Font.title.weight(.light))
                .foregroundColor(.white)
                .frame(height: 14, alignment: .leading)
            
            Text(minTemp)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
            
            Text(maxTemp)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
        
    }
}

#Preview {
    WeatherForecastCellView(weekday: "MON", iconImage: "cloud.fill", minTemp: "19°", maxTemp: "21°", minHumid: "75%", maxHumid: "90%")
        .background(.black)
}

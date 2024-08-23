# Quick Weather

## Overview
**Quick Weather** is an iOS app, which allows users check Hong Kong weather. 
It is still under development.<br/>
<img src="https://github.com/user-attachments/assets/d3859a13-4d72-4860-8b31-2c13fda03c92" width="200"/>
<img src="https://github.com/user-attachments/assets/ec3151e4-ea1e-4f2a-8369-9f19b15c2207" width="200"/><br/>
<img src="https://github.com/user-attachments/assets/33474269-5c7e-4a0f-92e6-8ad2e96fa599" width="200"/> 
<img src="https://github.com/user-attachments/assets/2bc7304b-1928-4173-8697-47fdac784f16" width="200"/>

## Features
- ✅ Show current weather
- ✅ 9-day weather forecase
- ✅ Day and night UI

## Tech Stack
- MVVM
- SwiftUI
- async / await
- actor

## Requirements
- iOS version: 15.0
- Xcode version: 15.0
- Swift version: 5

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/ElvisCtf/weather-ios-app.git
    ```
2. Build and run

## APIs
[Hong Kong Observatory Open Data API Documentation](https://www.hko.gov.hk/en/weatherAPI/doc/files/HKO_Open_Data_API_Documentation.pdf)
- local weather report:   https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=flw&lang=en
- 9-Day weather forecast: https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=fnd&lang=en

## Dependencies
The Swift Package Manager (SwiftPM) is used for managing dependencies.
- [Alamofire](https://github.com/Alamofire/Alamofire)

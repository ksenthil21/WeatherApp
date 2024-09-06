//
//  ContentView.swift
//  WeatherApp
//
//  Created by Karthikeyan Senthil on 4/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManger = LocationManager()
    var weatherManager = WeatherManager()
    //var imageManager = ImageManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManger.location {
                if let weather = weather {
                    WeatherView(weather: weather) //, image: imageManager)
                }
                else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather")
                            }
                        }
                }
            } else {
                if locationManger.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManger)
                }
            }
        }
        .background(Color(hue: 0.603, saturation: 0.92, brightness: 0.552))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}

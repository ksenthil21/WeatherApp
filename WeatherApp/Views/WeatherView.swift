//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Karthikeyan Senthil on 4/21/24.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
        
    var weather: ResponseBody
    //var image: ImageManager
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                    
                    let loc = LocationManager().location
                    AsyncImage(url: image.fetchFlickrImages(latitude: loc?.latitude ?? 37.8199, longitude: loc?.longitude ?? 122.4786),
                               content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    },
                               placeholder: {
                        ProgressView()
                    }
                    )
                    .frame(width: 300, height: 300)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .padding()
                    .padding()
                    //
                    //
                    //
                }
                frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°").font(.system(size: 70)).fontWeight(   .bold).padding()
                    }
                    Spacer().frame(height: 80)
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x:10,y:-150)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.603, saturation: 0.92, brightness: 0.552))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.603, saturation: 0.92, brightness: 0.552))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather) //, image: NULL)
 }


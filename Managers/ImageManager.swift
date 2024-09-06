//
//  ImageManager.swift
//  WeatherApp
//
//  Created by Karthikeyan Senthil on 7/11/24.
//

import UIKit
import Foundation
import CoreLocation

class ImageManager: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var outputURL: URL = URL(string: "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp")!
    
    func fetchFlickrImages(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> URL { //async throws -> URL {
            
            //var outputURL: URL
            let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=30ecb991a40b7245cd625f46e120a893&lat=\(latitude)&lon=\(longitude)&format=json&nojsoncallback=1"
            
            guard let url = URL(string: urlString) else { fatalError("Missing URL") }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in guard let data = data, error == nil else { return }
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let photosDict = json["photos"] as? [String: Any],
                       let photoArray = photosDict["photo"] as? [[String: Any]],
                       let firstPhoto = photoArray.first {
                        let farm = firstPhoto["farm"] as! Int
                        let server = firstPhoto["server"] as! String
                        let id = firstPhoto["id"] as! String
                        let secret = firstPhoto["secret"] as! String
                        let imageUrlString = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
                        //
                        //
                        self.outputURL = URL(string: imageUrlString)!
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
            task.resume()
            ///fix this error and it will be good
            ///the problem was that it was returning the wrong link
            print(self.outputURL)
            return outputURL
        }
}

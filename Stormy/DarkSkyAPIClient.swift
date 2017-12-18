//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by toby tang on 2017-12-05.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


class DarkSkyAPIClient {
    fileprivate let apiKey = "59b503cebfafef4911abcee84c026a55"
    
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinate, complitionHandler completion: @escaping CurrentWeatherCompletionHandler){
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        
        let request = URLRequest(url:url)
        
        let task = downloader.jsonTask(with: request){
            json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let currentWeatherJson = json["currently"] as? [String:AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                    completion(nil, .JSONParsingFailure)
                    return
                }
                
                completion(currentWeather, nil)
            }
            
            
        }
        
        task.resume()
        
    }
}



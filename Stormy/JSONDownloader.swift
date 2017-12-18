//
//  JSONDownloader.swift
//  Stormy
//
//  Created by toby tang on 2017-12-03.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class JSONDownloader{
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration){
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias JSON = [String: AnyObject]
    
    typealias JSONTaskCompleteionHandler = (JSON?, DarkSkyError?) -> Void
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompleteionHandler) -> URLSessionDataTask{
        let task = session.dataTask(with: request) {
            data, response, error in
            // convert to http response
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                        completion(json, nil)
                    } catch {
                        completion(nil, .JSONConverionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        
        return task
    }
    
}

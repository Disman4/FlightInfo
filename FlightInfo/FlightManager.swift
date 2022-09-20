//
//  FlightManager.swift
//  FlightInfo
//
//  Created by Tanaka Mawoyo on 19.09.22.
//

import Foundation

struct FlightManager {
    
    let flightURL = "https://airlabs.co/api/v9/flight?api_key=5eb680f1-5edd-4228-ae86-6b7a521f3a45"
    
    func fetchFlight(flightNumber: String){
        let urlString = "\(flightURL)&flight_iata=\(flightNumber)"
        performRequest(urlString: urlString)
    }
    
    //MARK: - Networking
    func performRequest(urlString: String){
        //1. Create a URL
        
        if let url = URL(string: urlString){
            
            //2. Create a UrlSession
            let session = URLSession(configuration: .default)
            
            //3. Give URLSession a task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            
            //4. Start the task
            task.resume()
            
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void{
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
    
}

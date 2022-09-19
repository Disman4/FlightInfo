//
//  FlightManager.swift
//  FlightInfo
//
//  Created by Tanaka Mawoyo on 19.09.22.
//

import Foundation

struct FlightManager {
    
    let flightURL = "http://api.aviationstack.com/v1/flights?access_key=b3ca408d77b4ef372c168d706194734b"
    
    func fetchFlight(flightNumber: String){
        let urlString = "\(flightURL)&flight_iata=\(flightNumber)"
        print(urlString)
    }
}

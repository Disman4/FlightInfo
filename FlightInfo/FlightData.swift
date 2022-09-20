//
//  FlightData.swift
//  FlightInfo
//
//  Created by Tanaka Mawoyo on 20.09.22.
//

import Foundation

struct FlightData: Decodable{
    
    let response: Response
}

struct Response: Decodable{
    let airline_name : String
    let flight_iata : String
}



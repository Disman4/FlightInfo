//
//  FlightData.swift
//  FlightInfo
//
//  Created by Tanaka Mawoyo on 20.09.22.
//

import Foundation

struct FlightData: Codable{
    
    let response: Response
}

struct Response: Codable{
    let airline_name : String
    let flight_iata : String
    let dep_city : String
    let arr_city : String
    let dep_iata : String
    let arr_iata : String
    let dep_time : String
    let arr_time : String
    let dep_terminal : String?
    let arr_terminal : String?
    let dep_gate : String?
    let arr_gate : String?
    
}



//
//  FlightManager.swift
//  FlightInfo
//
//  Created by Tanaka Mawoyo on 19.09.22.
//

import Foundation

 //MARK  : - FlightManagerDelegate Protocol
protocol FlightManagerDelegate{
    func didUpdateFlight(_ flightManger: FlightManager, flight: FlightModel)
    
    func didFailWithError(error: Error)
}

struct FlightManager {
    
    let flightURL = "https://airlabs.co/api/v9/flight?api_key=5eb680f1-5edd-4228-ae86-6b7a521f3a45"
    
    var delegate: FlightManagerDelegate?
    
    func fetchFlight(flightNumber: String){
        let urlString = "\(flightURL)&flight_iata=\(flightNumber)"
        performRequest(with: urlString)
    }
    
     //MARK  : -  Networking
    func performRequest(with urlString: String){
        //1. Create a URL
        
        if let url = URL(string: urlString){
            
            //2. Create a UrlSession
            let session = URLSession(configuration: .default)
            
            //3. Give URLSession a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    
                    if let flight = self.parseJSON(safeData){
                        self.delegate?.didUpdateFlight(self, flight: flight)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
            
        }
    }
    
     //MARK  : - JSON Parsing
    func parseJSON(_ flightData: Data) -> FlightModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(FlightData.self, from: flightData)
            
            let airlineName = decodedData.response.airline_name
            let airlineNumber = decodedData.response.flight_iata
            let departureCity = decodedData.response.dep_city
            let arrivalCity = decodedData.response.arr_city
            let departureAirport = decodedData.response.dep_iata
            let arrivalAirport = decodedData.response.arr_iata
            let departureTime = decodedData.response.dep_time
            let arrivalTime = decodedData.response.arr_time
            
            let departureTerminal = decodedData.response.dep_terminal
            let arrivalTerminal = decodedData.response.arr_terminal
            let departureGate = decodedData.response.dep_gate
            let arrivalGate = decodedData.response.arr_gate
            
            let flight = FlightModel(airlineName: airlineName, airlineNumber: airlineNumber, departureCity: departureCity, arrivalCity: arrivalCity, departureAirport: departureAirport, arrivalAirport: arrivalAirport, departureTime: departureTime, arrivalTime: arrivalTime, departureTerm: departureTerminal!, arrivalTerm: arrivalTerminal!, departureGate: departureGate!, arrivalGate: arrivalGate!)
            return flight
            
        } catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

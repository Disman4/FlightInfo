//
//  ViewController.swift
//  FlightInfo
//
//  Created by Tanaka Mawoyo on 19.09.22.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var flightNumber: UILabel!
    @IBOutlet weak var airlineName: UILabel!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var departureAirport: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var arrivalAirport: UILabel!
    @IBOutlet weak var departure: UILabel!
    @IBOutlet weak var arrival: UILabel!
    @IBOutlet weak var depTerminal: UILabel!
    @IBOutlet weak var arrTerminal: UILabel!
    @IBOutlet weak var depGate: UILabel!
    @IBOutlet weak var arrGate: UILabel!
    
    var flightManager = FlightManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        flightManager.delegate = self
        searchTextfield.delegate = self
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchTextfield.endEditing(true)
        print(searchTextfield.text!)
    }
    
}

//MARK  : - UITextFieldDelegate
extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextfield.endEditing(true)
        print(searchTextfield.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //USE searchTextfield.text TO GET FlIGHT INFO
        
        if let flight = searchTextfield.text{
            flightManager .fetchFlight(flightNumber: flight)
            
        }
        searchTextfield.text = ""
    }
}

//MARK  : - FlightManagerDelegate
extension ViewController: FlightManagerDelegate{
    func didUpdateFlight(_ flightManger: FlightManager, flight: FlightModel) {
        DispatchQueue.main.async {
            self.airlineName.text = flight.airlineName
            self.flightNumber.text = flight.airlineNumber
            self.from.text = flight.departureCity
            self.departureAirport.text = "(\(flight.departureAirport))"
            self.arrivalAirport.text = "(\(flight.arrivalAirport))"
            self.to.text = flight.arrivalCity
            self.departure.text = flight.departureTime
            self.arrival.text = flight.arrivalTime
            self.depTerminal.text = flight.departureTerm
            self.arrTerminal.text = flight.arrivalTerm
            self.depGate.text = flight.departureGate
            self.arrGate.text = flight.arrivalGate
            
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


//
//  ViewController.swift
//  FlightInfo
//
//  Created by Tanaka Mawoyo on 19.09.22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, FlightManagerDelegate{
    
    @IBOutlet weak var flightNumber: UILabel!
    @IBOutlet weak var airlineName: UILabel!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var departure: UILabel!
    @IBOutlet weak var arrival: UILabel!
    
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
    
    func didUpdateFlight(_ flightManger: FlightManager, flight: FlightModel) {
        DispatchQueue.main.async {
            self.airlineName.text = flight.airlineName
            self.flightNumber.text = flight.airlineNumber
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
  
    
    


}


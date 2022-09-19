//
//  ViewController.swift
//  FlightInfo
//
//  Created by Tanaka Mawoyo on 19.09.22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var flightNumber: UILabel!
    @IBOutlet weak var airlineName: UILabel!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var departure: UILabel!
    @IBOutlet weak var arrival: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        print(searchTextfield.text!)
    }
    
  
    
    


}


//
//  MangerViewController.swift
//  FR01
//
//  Created by Student07 on 15/06/2021.
//

import UIKit
import CoreLocation
import Alamofire

class MangerViewController: UIViewController {
    var localisation:CLLocation?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "MANGER"
        
    }
/*
    func setupData(){

        let parameter :Parameters = [
            "term":"food",
            "Latitude": localisation.coordinate.latitude,
            "Longitude": localisation.coordinate.longitude
            
        ]
        AF.request("https://api.yelp.com/v3/businesses/search",parameters: parameter)
    }

*/
}

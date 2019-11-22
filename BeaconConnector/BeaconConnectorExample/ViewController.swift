//
//  ViewController.swift
//  BeaconConnectorExample
//
//  Created by Thisharika Rangani on 18/11/19.
//  Copyright © 2019 Thisharika Rangani. All rights reserved.
//

import UIKit
import BeaconConnector

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let getLoc = Service.getLocation()
        print(getLoc)
        
    }


}


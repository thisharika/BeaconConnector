//
//  ViewController.swift
//  Example
//
//  Created by stone appy on 18/11/19.
//  Copyright © 2019 stone appy. All rights reserved.
//

import UIKit
import BeaconConnector

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let locationStr = Service.getLocation()
        print(locationStr)
    }


}


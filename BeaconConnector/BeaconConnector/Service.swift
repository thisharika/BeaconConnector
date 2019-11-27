//
//  Service.swift
//  BeaconConnector
//
//  Created by Thisharika Rangani on 18/11/19.
//  Copyright © 2019 Thisharika Rangani. All rights reserved.
//

import Foundation
import CoreLocation

open class Service: UIViewController, CLLocationManagerDelegate{
    
    //iBeacon tracking and responsible for requesting location permission from users
    let locationManager = CLLocationManager()
    
    var shopEnterTime: String = ""
    var shopLeaveTime: String = ""
    
   open override func viewDidLoad() {
        super.viewDidLoad()
    
        //CLLocationManager service setup
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    //CLLocationManager service setup
    public static func getLocation() -> String {
       return "connecting ibeacon.."
    }
    
    //check whether they are authorized to scan for iBeacons
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                    print("Scanning")
                }
            }
        }
    }
    
    //create CLBeaconRegion objects and pass them to the location manager
    func startScanning() {
        let uuid = UUID(uuidString: "CB10023F-A318-3394-4199-A8730C7C1AEC")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 8, minor: 10, identifier: "MyBeacon")
        
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    
    //When a matching iBeacon is detected, you can read a beacon's distance using its proximity value and take appropriate action.
    public func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        if beacons.count > 0 {
            updateDistance(beacons[0].proximity)
            
            if beacons[0].proximity == CLProximity.immediate{
                //Enter into the shop
                let currentDateTime = Date()
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                formatter.dateStyle = .short
                self.shopEnterTime = formatter.string(from: currentDateTime)
                
                //reset leaveTime variable
                self.shopLeaveTime = ""
            }
            else if beacons[0].proximity == CLProximity.far{
                //Leave the shop
                let currentDateTime = Date()
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                formatter.dateStyle = .short
                self.shopLeaveTime = formatter.string(from: currentDateTime)
            }
        } else {
            updateDistance(.unknown)
        }
    }
    
    //change background color depending on how far away an iBeacon
    func updateDistance(_ distance: CLProximity) {
        UIView.animate(withDuration: 0.8) {
            switch distance {
            case .unknown:
                self.view.backgroundColor = UIColor.gray
                
            case .far:
                self.view.backgroundColor = UIColor.blue
                
            case .near:
                self.view.backgroundColor = UIColor.orange
                
            case .immediate:
                self.view.backgroundColor = UIColor.red
                
            default:
                self.view.backgroundColor = UIColor.white
            }
        }
    }
    
}

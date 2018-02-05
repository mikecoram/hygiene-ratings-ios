//
//  LocationHandler.swift
//  Assignment2
//
//  Created by Mike Coram on 05/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import Foundation
import CoreLocation

class LocationHandler {
    let locationManager = CLLocationManager()

    func initLocationManager() {
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getLat() -> Double {
        return locationManager.location!.coordinate.latitude
    }
    
    func getLong() -> Double {
        return locationManager.location!.coordinate.longitude
    }

}

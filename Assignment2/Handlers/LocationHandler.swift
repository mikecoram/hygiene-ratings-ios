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
    
    init() {
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getCurrentCoordinate() -> Coordinate {
        let locManagerCoordinate = locationManager.location!.coordinate
        return Coordinate(latitude: locManagerCoordinate.latitude, longitude: locManagerCoordinate.longitude)
    }
}

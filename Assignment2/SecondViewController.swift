//
//  SecondViewController.swift
//  Assignment2
//
//  Created by Mike Coram on 29/01/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    let SPAN_SIZE = 0.005
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppState.updateCallbacks.append(initMap)
        initMap()
    }
    
    func initMap() {
        let coordinate = AppState.locationHandler.getCurrentCoordinate()
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(SPAN_SIZE, SPAN_SIZE)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(
            coordinate.latitude,
            coordinate.longitude
        )
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        DispatchQueue.main.async() {
            self.clearAnnotations()
            self.addAnnotations()
        }
    }
    
    func clearAnnotations() {
        map.removeAnnotations(map.annotations)
    }
    
    func addAnnotations() {
        for restaurant in AppState.restaurants {
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = CLLocationCoordinate2DMake(
                Double(restaurant.Latitude)!,
                Double(restaurant.Longitude)!
            )
            annotation.title = restaurant.BusinessName
            
            map.addAnnotation(annotation)
        }
    }
}


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initMap()
    }
    
    func initMap() {
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.001, 0.001)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(
            AppState.locationHandler.getLat(),
            AppState.locationHandler.getLong()
        )
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        print(AppState.restaurants.count)
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


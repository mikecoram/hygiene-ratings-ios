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
    
    let mapViewDelegate = MapViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppState.postPopulateCallbacks.append(setMap)
        
        initMap()
        setMap()
    }
    
    func initMap() {
        map.delegate = mapViewDelegate
        mapViewDelegate.parentView = self
        map.mapType = MKMapType.standard
    }
    
    func setMap() {
        clearAnnotations()
        addAnnotations()
        zoomToFitAnnotations()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Display selected restaurant details
        let selected = map.selectedAnnotations[0] as! CustomAnnotation
        (segue.destination as! DetailViewController).restaurant = selected.restaurant
    }
    
    func clearAnnotations() {
        map.showsUserLocation = false
        map.removeAnnotations(map.annotations)
    }
    
    func addAnnotations() {
        for restaurant in AppState.restaurants {
            MapViewDelegate.addAnnotation(restaurant, map: map)
        }
    }

    func zoomToFitAnnotations() {
        map.showsUserLocation = false // Don't include users location in the zooming
        map.showAnnotations(map.annotations, animated: true)
        map.showsUserLocation = true
    }
}


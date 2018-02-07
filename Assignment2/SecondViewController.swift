//
//  SecondViewController.swift
//  Assignment2
//
//  Created by Mike Coram on 29/01/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: MKPointAnnotation {
    var imageName: String!
}

class SecondViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var map: MKMapView!
    let SPAN_SIZE = 0.005
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppState.updateCallbacks.append(initMap)
        
        map.delegate = self
        map.mapType = MKMapType.standard
        map.showsUserLocation = true
        
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
        
        self.clearAnnotations()
        self.addAnnotations()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if let customPointAnnotation = annotation as? CustomAnnotation {
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = annotation
            }

            let image = UIImage(named: customPointAnnotation.imageName)
            annotationView?.image = image
        }
        
        return annotationView
    }
    
    func clearAnnotations() {
        map.removeAnnotations(map.annotations)
    }
    
    func addAnnotations() {
        for restaurant in AppState.restaurants {
            let annotation = CustomAnnotation()
            annotation.imageName = ImageHandler.getHygienePinName(restaurant.RatingValue)
            
            annotation.coordinate = CLLocationCoordinate2DMake(
                Double(restaurant.Latitude)!,
                Double(restaurant.Longitude)!
            )
            annotation.title = restaurant.BusinessName
            annotation.subtitle = ""
            
            map.addAnnotation(annotation)
        }
    }
}


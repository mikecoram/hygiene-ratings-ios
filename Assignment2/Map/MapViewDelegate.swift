//
//  MapViewDelegate.swift
//  Assignment2
//
//  Created by Mike Coram on 07/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewDelegate : UIViewController, MKMapViewDelegate {
    var parentView: UIViewController!
    
    static func addAnnotation(_ restaurant: Restaurant, map: MKMapView) {
        let annotation = RestaurantAnnotation()
        annotation.imageName = ImageHandler.getHygienePinName(restaurant.RatingValue)
        
        annotation.coordinate = CLLocationCoordinate2DMake(
            Double(restaurant.Latitude)!,
            Double(restaurant.Longitude)!
        )
        
        annotation.restaurant = restaurant
        annotation.title = restaurant.BusinessName
        
        if restaurant.DistanceKM != nil {
            annotation.subtitle = "\(formatDistance(restaurant.DistanceKM!))km away"
        }
        
        map.addAnnotation(annotation)
    }
    
    static func formatDistance(_ distance: String) -> String {
        return String(format: "%.2f", Double(distance)!)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if let customPointAnnotation = annotation as? RestaurantAnnotation {
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                
                if wasCalledFromMapController() {
                    annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                }
            } else {
                annotationView?.annotation = annotation
            }
            
            let image = UIImage(named: customPointAnnotation.imageName)
            annotationView?.image = image
        }
        
        return annotationView
    }
    
    func wasCalledFromMapController() -> Bool {
        return parentView is RestaurantMapViewController
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if wasCalledFromMapController() {
            parentView.performSegue(withIdentifier: "MapToDetail", sender: nil)
        }
    }
}

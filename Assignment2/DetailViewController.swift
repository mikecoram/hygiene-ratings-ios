//
//  DetailViewController.swift
//  Assignment2
//
//  Created by Mike Coram on 05/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController : UIViewController {
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var BusinessNameLabel: UILabel!
    
    @IBOutlet weak var AddressLabel: UILabel!
    
    @IBOutlet weak var CoordinatesLabel: UILabel!
    
    @IBOutlet weak var RatingDateLabel: UILabel!
    var restaurant : Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(
            Double(restaurant!.Latitude)!,
            Double(restaurant!.Longitude)!
        )
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = restaurant?.BusinessName
        
        map.addAnnotation(annotation)
        
        BusinessNameLabel.text = restaurant?.BusinessName
        AddressLabel.text = "\(restaurant!.AddressLine1)\n\(restaurant!.AddressLine2)\n\(restaurant!.AddressLine3)\n\(restaurant!.PostCode)"
        CoordinatesLabel.text = "Latitude:\(restaurant!.Latitude), Longitude:\(restaurant!.Longitude), Distance from current location:\(restaurant!.DistanceKM)"
        
        RatingDateLabel.text = restaurant!.RatingDate
    }
}

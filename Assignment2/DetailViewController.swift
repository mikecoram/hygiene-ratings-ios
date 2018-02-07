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
    @IBOutlet weak var hygieneImage: UIImageView!
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var BusinessNameLabel: UILabel!
    
    @IBOutlet weak var AddressLabel: UILabel!
    
    @IBOutlet weak var CoordinatesLabel: UILabel!
    
    @IBOutlet weak var RatingDateLabel: UILabel!
    
    let SPAN_SIZE = 0.005
    var restaurant : Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(SPAN_SIZE, SPAN_SIZE)
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
        
        RatingDateLabel.text = "Rated on: \(restaurant!.RatingDate)"
        
        hygieneImage.image = UIImage.init(named: ImageHandler.getHygieneImageLocation(rating: restaurant!.RatingValue))
    }
}

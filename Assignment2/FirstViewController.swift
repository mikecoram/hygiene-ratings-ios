//
//  FirstViewController.swift
//  Assignment2
//
//  Created by Mike Coram on 29/01/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var restaurantTable: UITableView!
    
    var restaurants = [Restaurant]()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLocationManager()
        initRestaurantTable()
        
        apiCall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    func getLong() -> Double {
        return locationManager.location!.coordinate.longitude
    }
    
    func getLat() -> Double {
        return locationManager.location!.coordinate.latitude
    }
    
    func initRestaurantTable() {
        restaurantTable.dataSource = self
        restaurantTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restaurantTable.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantCell
        
        let restaurant = restaurants[indexPath.row]
        
        var rating = restaurant.RatingValue
        if (rating == "-1") {
            rating = "Exempt"
        }
        
        cell.nameLabel.text = "\(restaurant.BusinessName) - \(rating)"
        return cell
    }
    
    func complete(restaurants: [Restaurant]?, error: Error?) -> Void {
        self.restaurants = restaurants!
        
        DispatchQueue.main.async() {
            self.restaurantTable.reloadData()
        }
    }
    
    func apiCall() {
        ApiHelper.getNearestRestaurants(lat: getLat(), long: getLong(), completionHandler: complete)
        
    }

}


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

class FirstViewController: UIViewController {
    @IBOutlet weak var restaurantTable: UITableView!
    var spinner : UIView!
    
    let restaurantTableSource = RestaurantTableDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initRestaurantTable()
        AppState.updateCallbacks.append(updateRestaurantsTable)
        AppState.popluateRestaurantsByLocation(coordinate: AppState.locationHandler.getCurrentCoordinate())
    }
    
    func initRestaurantTable() {
        restaurantTable.dataSource = restaurantTableSource
        restaurantTable.delegate = restaurantTableSource
    }
    
    func updateRestaurantsTable() -> Void {
        self.restaurantTableSource.setRestaurants(restaurants: AppState.restaurants)
        self.restaurantTable.reloadData()
        
        // Scroll back to top
        if AppState.restaurants.count > 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            self.restaurantTable.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Display selected restaurant details
        let cell = sender as! RestaurantCell
        let restaurant = AppState.restaurants[cell.index!]
        (segue.destination as! DetailViewController).restaurant = restaurant
    }
}


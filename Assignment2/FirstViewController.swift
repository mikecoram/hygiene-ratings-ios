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
        // Reload the table view on the main thread
        DispatchQueue.main.async() {
            self.restaurantTableSource.setRestaurants(restaurants: AppState.restaurants)
            self.restaurantTable.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Display selected restaurant details
        let cell = sender as! RestaurantCell
        let restaurant = AppState.restaurants[cell.index!]
        (segue.destination as! DetailViewController).restaurant = restaurant
    }
}


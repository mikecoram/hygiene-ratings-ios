//
//  RestaurantTable.swift
//  Assignment2
//
//  Created by Mike Coram on 05/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import UIKit
import Foundation

class RestaurantTableDataSource : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var restaurants = [Restaurant]()
    
    func setRestaurants(restaurants : [Restaurant]) {
        self.restaurants = restaurants
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantCell
        
        cell.index = indexPath.row
        
        let restaurant = restaurants[indexPath.row]
        
        cell.hygieneImage.image = UIImage.init(named: ImageHandler.getHygieneImageLocation(rating: restaurant.RatingValue))
        cell.nameLabel.text = restaurant.BusinessName
        
        return cell
    }    
}

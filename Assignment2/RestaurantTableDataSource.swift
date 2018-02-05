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
        
        let restaurant = restaurants[indexPath.row]
        
        var rating = restaurant.RatingValue
        if (rating == "-1") {
            rating = "exempt"
        }
        
        cell.hygieneImage.image = UIImage.init(named: ImageHandler.getHygieneImageLocation(rating: rating))
        
        cell.index = indexPath.row
        cell.nameLabel.text = restaurant.BusinessName
        return cell
    }    
}

//
//  FirstViewController.swift
//  Assignment2
//
//  Created by Mike Coram on 29/01/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var restaurantTable: UITableView!
    
    var restaurants = [Restaurant]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restaurantTable.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantCell
        
        let restaurant = restaurants[indexPath.row]
        
        cell.nameLabel.text = "\(restaurant.BusinessName)"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mcdonalds = Restaurant()
        mcdonalds.BusinessName = "McDonalds"
        restaurants.append(mcdonalds)
        
        restaurantTable.dataSource = self
        restaurantTable.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


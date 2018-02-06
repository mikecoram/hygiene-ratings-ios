//
//  ApiHelper.swift
//  Assignment2
//
//  Created by Mike Coram on 29/01/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import Foundation

class Api {
    static var BASE_URL = "http://radikaldesign.co.uk/sandbox/hygiene.php"
        
    static func getRestaurantsNearestToLocation(coordinate: Coordinate, completionHandler: @escaping ([Restaurant]?, Error?) -> Void) {
        getRestaurants(query: "?op=s_loc&lat=\(coordinate.latitude)&long=\(coordinate.longitude)", completionHandler: completionHandler)
    }
    
    static func getRestaurantsByName(name: String, completionHandler: @escaping ([Restaurant]?, Error?) -> Void) {
        getRestaurants(query: "?op=s_name&name=\(name)", completionHandler: completionHandler)
    }
    
    static func getRestaurantsByPostcode(postcode: String, completionHandler: @escaping ([Restaurant]?, Error?) -> Void) {
        getRestaurants(query: "?op=s_postcode&postcode=\(postcode)", completionHandler: completionHandler)
    }
        
    class func getRestaurants(query: String, completionHandler: @escaping ([Restaurant]?, Error?) -> Void) {
        let url = URL(string: "\(BASE_URL)\(query)")
        
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                do {
                    let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                    completionHandler(restaurants, nil)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

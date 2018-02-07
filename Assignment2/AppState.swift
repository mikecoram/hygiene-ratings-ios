//
//  AppState.swift
//  Assignment2
//
//  Created by Mike Coram on 05/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import Foundation

class AppState {
    static var title = String()
    static var restaurants : [Restaurant] = [Restaurant]()
    static let locationHandler = LocationHandler()
    static var updateCallbacks = [() -> Void]()
    static var setViewTitle : ((_ :String) -> Void)?
    
    class func complete(restaurants: [Restaurant]?, error: Error?) -> Void {
        AppState.restaurants = restaurants!
        
        for callback in updateCallbacks {
            callback()
        }
    }
    
    static func popluateRestaurantsByLocation(coordinate: Coordinate) {
        setTitle("Nearest Restaurants")
        Api.getRestaurantsNearestToLocation(coordinate: coordinate, completionHandler: complete)
    }
    
    static func populateRestaurantsByName(name: String) {
        setTitle("'\(name)'")
        Api.getRestaurantsByName(name: name, completionHandler: complete)
    }
    
    static func populateRestaurantsByPostcode(postcode: String) {
        setTitle("'\(postcode)'")
        Api.getRestaurantsByPostcode(postcode: postcode, completionHandler: complete)
    }
    
    static func setTitle(_ title: String) {
        setViewTitle!(title)
    }
}

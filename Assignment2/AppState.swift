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
    
    // Functions to call after the restaurants array has been populated
    static var postPopulateCallbacks = [() -> Void]()
    
    static var setViewTitle : ((_ :String) -> Void)?
    
    class func complete(restaurants: [Restaurant]?, error: Error?) -> Void {
        if error == nil {
            AppState.restaurants = restaurants!
        }
        else {
            AppState.restaurants = [Restaurant]()
        }
        
        for callback in postPopulateCallbacks {
            callback()
        }
    }
    
    static func popluateRestaurantsByLocation(coordinate: Coordinate) {
        setTitle("Nearest Restaurants")
        
        Api.getRestaurantsNearestToLocation(
            coordinate: coordinate,
            completionHandler: complete
        )
    }
    
    static func populateRestaurantsByName(name: String) {
        setTitle("'\(name)'")
        
        Api.getRestaurantsByName(
            name: name,
            completionHandler: complete
        )
    }
    
    static func populateRestaurantsByPostcode(postcode: String) {
        setTitle("'\(postcode)'")
        
        Api.getRestaurantsByPostcode(
            postcode: postcode,
            completionHandler: complete
        )
    }
    
    static func setTitle(_ title: String) {
        setViewTitle!(title)
    }
}

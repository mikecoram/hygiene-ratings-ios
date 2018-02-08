//
//  AppState.swift
//  Assignment2
//
//  Created by Mike Coram on 05/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import Foundation

class AppState {
    enum QueryType {
        case nearest
        case byPostcode
        case byName
    }
    
    static let locationHandler = LocationHandler()

    static var restaurants: [Restaurant] = [Restaurant]()
    static var queryType: QueryType = QueryType.nearest
    
    // Functions to call after the restaurants array has been populated
    static var postPopulateCallbacks = [() -> Void]()
    
    static var setViewTitle: ((_ :String) -> Void)?
    
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
        queryType = QueryType.nearest
        
        ApiHandler.getRestaurantsNearestToLocation(
            coordinate: coordinate,
            completionHandler: complete
        )
    }
    
    static func populateRestaurantsByName(name: String) {
        setTitle("'\(name)'")
        queryType = QueryType.byName
        
        ApiHandler.getRestaurantsByName(
            name: name,
            completionHandler: complete
        )
    }
    
    static func populateRestaurantsByPostcode(postcode: String) {
        setTitle("Restaurants at: '\(postcode)'")
        queryType = QueryType.byPostcode
        
        ApiHandler.getRestaurantsByPostcode(
            postcode: postcode,
            completionHandler: complete
        )
    }
    
    static func setTitle(_ title: String) {
        setViewTitle!(title)
    }
}

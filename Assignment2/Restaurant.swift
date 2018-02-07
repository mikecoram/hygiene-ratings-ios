//
//  Restaurant.swift
//  Assignment2
//
//  Created by Mike Coram on 29/01/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import Foundation

struct Restaurant : Codable {
    var id: String
    var BusinessName: String
    var AddressLine1: String
    var AddressLine2: String
    var AddressLine3: String
    var PostCode: String
    var RatingValue: String
    var RatingDate: String
    var Longitude: String
    var Latitude: String
    //var DistanceKM: String
}

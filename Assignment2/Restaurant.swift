//
//  Restaurant.swift
//  Assignment2
//
//  Created by Mike Coram on 29/01/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import Foundation

class Restaurant {
    var id: Int
    var BusinessName: String
    var AddressLine1: String
    var AddressLine2: String
    var AddressLine3: String
    var PostCode: String
    var RatingValue: Int
    var RatingDate: Date
    var Longitude: Decimal
    var Latitude: Decimal
    
    init() {
        self.id = -1
        self.BusinessName = ""
        self.AddressLine1 = ""
        self.AddressLine2 = ""
        self.AddressLine3 = ""
        self.PostCode = ""
        self.RatingValue = -2
        self.RatingDate = Date()
        self.Longitude = 0
        self.Latitude = 0
    }
}

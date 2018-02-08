//
//  ImageHandler.swift
//  Assignment2
//
//  Created by Mike Coram on 05/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import Foundation

class ImageHandler {
    static func getHygieneImageLocation(rating: String) -> String {
        return "\(parseRating(rating)).jpg"
    }
    
    static func getHygienePinName(_ rating: String) -> String {
        return "\(parseRating(rating))-pin.png"
    }
    
    static func parseRating(_ rating: String) -> String {
        switch rating {
        case "1", "2", "3", "4", "5":
            return rating
        case "-1":
            return "exempt"
        default:
            return "awaiting-inspection"
        }
    }
}

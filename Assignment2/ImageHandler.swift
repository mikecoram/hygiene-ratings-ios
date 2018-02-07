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
        return "\(rating).jpg"
    }
    
    static func getHygienePinName(_ rating: String) -> String {
        return "\(rating)-pin.png"
    }
}

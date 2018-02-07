//
//  TabBarController.swift
//  Assignment2
//
//  Created by Mike Coram on 05/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    @IBOutlet weak var NavItem: UINavigationItem!
    var spinner : UIView!
    
    @IBAction func clickNearest(_ sender: Any) {
        displaySpinner()
        AppState.popluateRestaurantsByLocation(coordinate: AppState.locationHandler.getCurrentCoordinate())
    }
    
    override func viewDidLoad() {
        AppState.setViewTitle = setTitle
        AppState.postPopulateCallbacks.append(removeSpinner)
        
        initSpinner()
        displaySpinner()
    }
    
    func setTitle(_ title: String) {
        NavItem.title = title
    }
}

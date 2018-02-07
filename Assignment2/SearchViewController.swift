//
//  SearchViewController.swift
//  Assignment2
//
//  Created by Mike Coram on 06/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import UIKit

class SearchSelection {
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
}

class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchSelector: UISegmentedControl!
    @IBOutlet weak var searchTerm: UISearchBar!

    var byPostcode = SearchSelection(index: 0)
    var byName = SearchSelection(index: 1)
    
    @IBAction func getResultsClick(_ sender: Any) {
        populateRestaurants()
    }
    
    func searchBarSearchButtonClicked(_:UISearchBar) {
        populateRestaurants()
    }
    
    func populateRestaurants() {
        let index = searchSelector.selectedSegmentIndex
        let query = searchTerm.text!
        
        switch index {
        case byName.index:
            AppState.populateRestaurantsByName(name: query)
            break
        case byPostcode.index:
            AppState.populateRestaurantsByPostcode(postcode: query)
            break
        default:
            break
        }
        
        navigationController?.popViewController(animated: true)
        let tabBarController = navigationController?.topViewController as! TabBarController
        tabBarController.displaySpinner()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTerm.delegate = self
    }
}

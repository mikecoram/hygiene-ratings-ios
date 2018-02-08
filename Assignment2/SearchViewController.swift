//
//  SearchViewController.swift
//  Assignment2
//
//  Created by Mike Coram on 06/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchSelector: UISegmentedControl!
    @IBOutlet weak var searchTerm: UISearchBar!

    let BY_POSTCODE_INDEX = 0
    let BY_NAME_INDEX = 1
    
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
        case BY_NAME_INDEX:
            AppState.populateRestaurantsByName(name: query)
            break
        case BY_POSTCODE_INDEX:
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
        
        switch AppState.queryType {
        case .byName:
            searchSelector.selectedSegmentIndex = BY_NAME_INDEX
            break
        default:
            searchSelector.selectedSegmentIndex = BY_POSTCODE_INDEX
            break
        }
    }
}

//
//  Spinner.swift
//  Assignment2
//
//  Created by Mike Coram on 07/02/2018.
//  Copyright © 2018 Mike Coram. All rights reserved.
//

import Foundation
import UIKit

extension TabBarController {
    func initSpinner() {
        spinner = UIView.init(frame: view.bounds)
        spinner.backgroundColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinner.center
        
        DispatchQueue.main.async {
            self.spinner.addSubview(ai)
        }
    }
    
    func displaySpinner() -> Void {
        DispatchQueue.main.async {
            self.view.addSubview(self.spinner)
        }
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.spinner.removeFromSuperview()
        }
    }
}

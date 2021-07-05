//
//  ViewController.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 30/6/2564 BE.
//

import UIKit

class WeatherViewController: UIViewController {
    

    @IBOutlet weak var searchBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func showSearchBar(_ sender: UIButton) {
        if searchBar.isHidden {
            searchBar.isHidden = false
        } else {
            searchBar.isHidden = true
        }
//        searchBar.isHidden = true
    }
    
}


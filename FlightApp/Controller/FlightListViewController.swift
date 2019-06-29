//
//  FlightListViewController.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import UIKit

class FlightListViewController: UIViewController {
    @IBOutlet weak var flightListTableView: UITableView!
    private let flighViewModel = FlightListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setTableViewCustomSetting()
        
        // Add Listener From ViewModel
        self.addListenerFromViewModel()
    }

}

// MARK:- Private Methods
extension FlightListViewController {
    private func setTableViewCustomSetting() {
        self.flightListTableView.delegate = flighViewModel
        self.flightListTableView.dataSource = flighViewModel
    }
    
    private func addListenerFromViewModel() {
       
    }
    
}

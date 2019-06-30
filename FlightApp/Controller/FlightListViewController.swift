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
    var sortVC = SortViewController()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setTableViewCustomSetting()
        
        // Add Listener From ViewModel
        self.addListenerFromViewModel()
        
        // Get FlightList From Server
        flighViewModel.getFlightDetailsList()

    }

    @IBAction func sortClicked(_ sender: Any) {
        sortVC = self.storyboard?.instantiateViewController(withIdentifier: "SortViewController") as! SortViewController
        sortVC.delegate = self
        self.addChild(sortVC)
        self.view.addSubview(sortVC.view)
    }
}

// MARK:- Private Methods
extension FlightListViewController {
    private func setTableViewCustomSetting() {
        self.flightListTableView.delegate = flighViewModel
        self.flightListTableView.dataSource = flighViewModel
    }
    
    private func addListenerFromViewModel() {
        flighViewModel.reloadDataClosure = { [weak self] in
            DispatchQueue.main.async {
                if let this = self {
                    this.flightListTableView.reloadData()
                }
            }
        }
    }
    
    private func removeSortView() {
        self.sortVC.view.removeFromSuperview()

    }
}

// MARK:- SortViewControllerDelegate Methods
extension FlightListViewController: SortViewControllerDelegate {
    func didClickOncancel() {
        removeSortView()
    }
    func didClickOnok(sortType:FlightSort?) {
        if let type = sortType {
            self.flighViewModel.sortList(type: type)
        }
        removeSortView()
    }
}

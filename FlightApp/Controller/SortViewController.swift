//
//  SortViewController.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import UIKit

enum FlightSort: String {
    case price = "Price"
    case takeOff = "Take-Off"
    case landingTime = "Landing Time"

}

protocol SortViewControllerDelegate {
    func didClickOncancel()
    func didClickOnok(sortType:FlightSort?)
}

class SortViewController: UIViewController {

    private var sortingList:[FlightSort] = [.price,.takeOff,.landingTime]
    
    private var selectedIndex: Int = -1 {
        didSet {
                    self.sortListTableView.reloadData()
         }
    }
    
    
    var delegate: SortViewControllerDelegate?
    @IBOutlet weak var sortListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    }

    @IBAction func cancelClicked(_ sender: Any) {
        if let del = self.delegate {
            del.didClickOncancel()
        }
    }
    @IBAction func okClicked(_ sender: Any) {

        if let del = self.delegate {
            _ = self.selectedIndex == -1 ? del.didClickOnok(sortType: nil) : del.didClickOnok(sortType: self.sortingList[self.selectedIndex])
        }
    }
    
}

// MARK:- UITableViewDataSource Methods
extension SortViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sortingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel!.text = self.sortingList[indexPath.row].rawValue
        cell.accessoryType = selectedIndex == indexPath.row ? .checkmark : .none
        return cell
    }
}
// MARK:- UITableViewDelegate Methods
extension SortViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
    }
}

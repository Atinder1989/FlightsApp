//
//  SortViewController.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import UIKit

protocol SortViewControllerDelegate {
    func didClickOncancle()
    func didClickOnok()
}

class SortViewController: UIViewController {

    var delegate: SortViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelClicked(_ sender: Any) {
        
    }
    @IBAction func okClicked(_ sender: Any) {
        
    }
    
}

extension SortViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel!.text = "123"
        return cell
        
    }
}


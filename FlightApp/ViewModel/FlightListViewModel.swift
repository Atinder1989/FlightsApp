//
//  FlightListViewModel.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation
import UIKit

class FlightListViewModel: NSObject {
    
}

extension FlightListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.identifier,
                                                    for: indexPath) as? FlightCell {
            return cell
        }
        return UITableViewCell()

    }
}


extension FlightListViewModel: UITableViewDelegate {
    
}

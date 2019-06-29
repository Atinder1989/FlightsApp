//
//  FlightCell.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import UIKit

class FlightCell: UITableViewCell {
    @IBOutlet weak var flightImageView: UIImageView!
    @IBOutlet weak var flightName: UILabel!
    @IBOutlet weak var flightFrom: UILabel!
    @IBOutlet weak var flightTo: UILabel!
    @IBOutlet weak var flightFromTime: UILabel!
    @IBOutlet weak var flightToTime: UILabel!
    @IBOutlet weak var flightTotalTimeDuration: UILabel!
    @IBOutlet weak var flightClass: UILabel!
    @IBOutlet weak var flightPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

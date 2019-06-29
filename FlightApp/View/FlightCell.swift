//
//  FlightCell.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import UIKit

class FlightCell: UITableViewCell {
    @IBOutlet weak var flightLogo: UIImageView!
    @IBOutlet weak var flightName: UILabel!
    @IBOutlet weak var flightFrom: UILabel!
    @IBOutlet weak var flightTo: UILabel!
    @IBOutlet weak var flightFromTime: UILabel!
    @IBOutlet weak var flightToTime: UILabel!
    @IBOutlet weak var flightDuration: UILabel!
    @IBOutlet weak var flightClass: UILabel!
    @IBOutlet weak var flightPrice: UILabel!
    @IBOutlet weak var flightDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: Configure Cell
    func configureCell(model:FlightData) {
       self.flightName.text  = model.flightName
       self.flightLogo.image = model.flightLogo
       self.flightPrice.text = model.price
       self.flightClass.text = model.airLineClass
       self.flightFrom.text = model.flightFromName
       self.flightTo.text = model.flightToName
       self.flightFromTime.text = model.flightFromTime
       self.flightToTime.text = model.flightToTime
       self.flightDuration.text = model.flightDuration
       self.flightDate.text = model.flightDate
    }

}

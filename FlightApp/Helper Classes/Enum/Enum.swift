//
//  Enum.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation
import UIKit

enum Airlinemap: String {
    case SJ                = "Spicejet"
    case AI                = "Air India"
    case G8                = "Go Air"
    case JA                = "Jet Airways"
    case IN                = "Indigo"
    case None              = "none"

    init(_ value: String) {
        switch value {
        case "SJ": self = .SJ
        case "AI": self = .AI
        case "G8": self = .G8
        case "JA": self = .JA
        case "IN": self = .IN
        default: self = .None
        }
    }
    
    func getFlightImage() -> UIImage {
        return (UIImage.init(named:self.rawValue) ??  UIImage.init(named: "placeHolder")!)
    }
}


enum Airportmap: String {
    case DEL                = "New Delhi"
    case MUM                = "Mumbai"
    case None              = "none"

    init(_ value: String) {
        switch value {
        case "DEL": self = .DEL
        case "MUM": self = .MUM
        default: self = .None
        }
    }
}


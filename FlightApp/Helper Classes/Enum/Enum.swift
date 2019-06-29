//
//  Enum.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation

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
}

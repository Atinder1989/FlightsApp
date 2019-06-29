//
//  ServiceParsingKeys.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation

enum ServiceParsingKeys : String, CodingKey {
    case airlineMap          =   "airlineMap"
    case sj                  =   "SJ"
    case ai                  =   "AI"
    case g8                  =   "G8"
    case ja                  =   "JA"
    case ind                 =   "IN"
    
    case airportMap          =   "airportMap"
    case del                 =   "DEL"
    case mum                 =   "MUM"
    
    case flightsData         =   "flightsData"
    case originCode                  =   "originCode"
    case destinationCode                  =   "destinationCode"
    case takeoffTime                  =   "takeoffTime"
    case landingTime                  =   "landingTime"
    case price                 =   "price"
    
    case airlineCode                 =   "airlineCode"
    case airLineClass                 =   "class"
}

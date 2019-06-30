//
//  FlightDetailResponse.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation

struct FlightDetailResponse: Codable {
    var flightData: [FlightData]

    init(from decoder:Decoder) throws {
    let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
    self.flightData    = try container.decodeIfPresent([FlightData].self, forKey: .flightsData) ?? []
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}




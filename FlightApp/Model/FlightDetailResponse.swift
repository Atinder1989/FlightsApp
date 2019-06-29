//
//  FlightDetailResponse.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation

struct FlightDetailResponse: Codable {
   
    var airlinemap: Airlinemap?
    var airportmap: Airportmap?
    var flightData: [FlightData]


    init(from decoder:Decoder) throws {
    let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
    self.airlinemap    = try container.decodeIfPresent(Airlinemap.self, forKey: .airlineMap) ?? nil
    self.airportmap    = try container.decodeIfPresent(Airportmap.self, forKey: .airportMap) ?? nil
    self.flightData    = try container.decodeIfPresent([FlightData].self, forKey: .flightsData) ?? []
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

struct Airlinemap: Codable {
    var sj: String
    var ai: String
    var g8: String
    var ja: String
    var ind: String

    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
        self.sj = try container.decodeIfPresent(String.self, forKey: .sj) ?? ""
        self.ai = try container.decodeIfPresent(String.self, forKey: .ai) ?? ""
        self.g8 = try container.decodeIfPresent(String.self, forKey: .g8) ?? ""
        self.ja = try container.decodeIfPresent(String.self, forKey: .ja) ?? ""
        self.ind = try container.decodeIfPresent(String.self, forKey: .ind) ?? ""
    }
    func encode(to encoder: Encoder) throws {
        
    }
}

struct Airportmap: Codable {
    var del: String
    var mum: String
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
        self.del = try container.decodeIfPresent(String.self, forKey: .del) ?? ""
        self.mum = try container.decodeIfPresent(String.self, forKey: .mum) ?? ""
    }
    func encode(to encoder: Encoder) throws {
        
    }
}

struct FlightData: Codable {
    var originCode: String
    var destinationCode: String
    var takeoffTime: String
    var landingTime: String
    var price: String
    var airlineCode: String
    var airLineClass: String
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
        self.originCode = try container.decodeIfPresent(String.self, forKey: .originCode) ?? ""
        self.destinationCode = try container.decodeIfPresent(String.self, forKey: .destinationCode) ?? ""
        self.takeoffTime = try container.decodeIfPresent(String.self, forKey: .takeoffTime) ?? ""
        self.landingTime = try container.decodeIfPresent(String.self, forKey: .landingTime) ?? ""
        self.price = try container.decodeIfPresent(String.self, forKey: .price) ?? ""
        self.airlineCode = try container.decodeIfPresent(String.self, forKey: .airlineCode) ?? ""
        self.airLineClass = try container.decodeIfPresent(String.self, forKey: .airLineClass) ?? ""

    }
    func encode(to encoder: Encoder) throws {
        
    }
}

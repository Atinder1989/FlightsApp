//
//  FlightDetailResponse.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation
import UIKit

struct FlightDetailResponse: Codable {
    var flightData: [FlightData]

    init(from decoder:Decoder) throws {
    let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
    self.flightData    = try container.decodeIfPresent([FlightData].self, forKey: .flightsData) ?? []
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
    var flightName: String
    var flightLogo: UIImage
    var flightFromName: String
    var flightToName: String
    var flightFromTime: String
    var flightToTime: String
    var flightDuration: String
    var flightDate: String
    var priceInInt: Int
    var takeOffInDouble: Double
    var landingTimeDouble: Double

    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
        self.originCode = try container.decodeIfPresent(String.self, forKey: .originCode) ?? ""
        self.destinationCode = try container.decodeIfPresent(String.self, forKey: .destinationCode) ?? ""
        self.takeoffTime = try container.decodeIfPresent(String.self, forKey: .takeoffTime) ?? ""
        self.takeOffInDouble = Double(self.takeoffTime) ?? 0

        self.landingTime = try container.decodeIfPresent(String.self, forKey: .landingTime) ?? ""
        self.landingTimeDouble = Double(self.landingTime) ?? 0

        self.price = try container.decodeIfPresent(String.self, forKey: .price) ?? ""
        self.priceInInt = Int(self.price) ?? 0
        
        self.airlineCode = try container.decodeIfPresent(String.self, forKey: .airlineCode) ?? ""
        self.airLineClass = try container.decodeIfPresent(String.self, forKey: .airLineClass) ?? ""
        
        let map = Airlinemap.init(self.airlineCode)
        self.flightName = map.rawValue
        self.flightLogo = map.getFlightImage()
        
        
        self.flightFromName = Airportmap.init(self.originCode).rawValue
        self.flightToName = Airportmap.init(self.destinationCode).rawValue

        self.flightFromTime = Date.convertTimeStamptoFlightDateTime(timeStamp: self.takeoffTime, dateFormat: "hh:mm a")
        self.flightToTime = Date.convertTimeStamptoFlightDateTime(timeStamp: self.landingTime, dateFormat: "hh:mm a")
        self.flightDate = Date.convertTimeStamptoFlightDateTime(timeStamp: self.takeoffTime, dateFormat: "dd MMM yyyy")
        
        let components = Date.getDifferenceBetweenTwoTimeStamp(fromTimeStamp: self.takeoffTime, toTimeStamp: self.landingTime)
        
        var duration = ""
        
        if let hour = components.hour {
            if hour > 0 {
                duration = duration + "\(hour)h"
            }
        }
        
        if let minute = components.minute {
            if minute > 0 {
                duration = duration + " \(minute)m"
            }
        }
        self.flightDuration = duration
        
    }
    func encode(to encoder: Encoder) throws {
        
    }
}


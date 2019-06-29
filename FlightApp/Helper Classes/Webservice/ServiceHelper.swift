//
//  ServiceHelper.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation

enum ServiceEnvironment : String {
    case production   = "https://www.ixigo.com/"
}

class ServiceHelper: NSObject {
    static private var baseURL: ServiceEnvironment {
        get {
            return ServiceEnvironment.production
        }
    }
}

//MARK: All Apis
extension ServiceHelper {
    static func getSampleFlightDataUrl() -> String {
        return baseURL.rawValue + "sampleFlightData"
    }
}

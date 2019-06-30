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
    var reloadDataClosure: (() -> Void)? = nil
    private var flightDataList: [FlightData] = [] {
        didSet {
            if let reload = reloadDataClosure {
                reload()
            }
        }
    }
}

// MARK:- Public Methods
extension FlightListViewModel{
    // MARK: Get Mobile Data Usage Information
    func getFlightDetailsList() {
        var service = Service.init(httpMethod: WebserviceHTTPMethod.get)
        service.url = ServiceHelper.getSampleFlightDataUrl()
        
        ServiceManager.processDataFromServer(service: service, model: FlightDetailResponse.self) { (response, error) in
            
            if error != nil {
                self.flightDataList = []
                return
            }
            
            if let res = response {
                self.flightDataList = res.flightData
            } else {
                self.flightDataList = []
            }
            
        }
    }
    
    func sortList(type:FlightSort) {
        switch type {
        case .price:
            self.sortListByPrice()
            break
        case .landingTime:
            self.sortListByLandingTime()
            break
        case .takeOff:
            self.sortListByTakeOff()
            break
        }
    }
    
  
}

// MARK:- Private Methods
extension FlightListViewModel{
    private func sortListByPrice() {
     self.flightDataList = self.flightDataList.sorted(by: {$0.priceInInt < $1.priceInInt} )
    }
    private func sortListByTakeOff() {
        self.flightDataList = self.flightDataList.sorted(by: {$0.takeOffInDouble < $1.takeOffInDouble} )
    }
    private func sortListByLandingTime() {
        self.flightDataList = self.flightDataList.sorted(by: {$0.landingTimeDouble > $1.landingTimeDouble} )
    }
}

// MARK:- UITableViewDataSource Methods
extension FlightListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flightDataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.identifier,
                                                    for: indexPath) as? FlightCell {
        cell.configureCell(model: self.flightDataList[indexPath.row])
        return cell
        }
        return UITableViewCell()

    }
}

// MARK:- UITableViewDelegate Methods
extension FlightListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//
//  CollectionsOperation.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 15.08.2022.
// 

import Foundation

class CellPressingAction {
    
    func cellPressed(fillingInstance: CellsFilling, beginingOfCarculation: (() -> Void)? = nil, completion: (() -> Void)? = nil) {
        guard fillingInstance.state == .initiated else { return }
        fillingInstance.state = .computing
        beginingOfCarculation?()
        DispatchQueue.global().async {
            let startTime = DispatchTime.now()
            fillingInstance.perform()
            let endTime = DispatchTime.now()
            let duration = Double((endTime.rawValue - startTime.rawValue)) / 1000000000
            let resultString = "time: \(String(duration)) ms."
            DispatchQueue.main.async {
                fillingInstance.state = .completed
                fillingInstance.output = resultString
                completion?()
            }
        }
    }
}

//
//  CollectionsOperation.swift
//  Collections
//
//  Created by Константин Канюка on 15.08.2022.
// 

import Foundation

class CollectionOperations {
    func perform(operation: Operation, launchedComputing: (() -> Void)? = nil, completion: (() -> Void)? = nil) {
        guard operation.state == .initial else {
            return
        }
        
        operation.state = .computing
        launchedComputing?()
        DispatchQueue.global().async {
            let startTime = DispatchTime.now()
            operation.perform()
            let endTime = DispatchTime.now()
            let duration = Double((endTime.rawValue - startTime.rawValue)) / 1000000000
            let resultString = "time: \(String(duration)) ms."
            DispatchQueue.main.async {
                operation.state = .computed
                operation.output = resultString
                completion?()
            }
        }
    }
}

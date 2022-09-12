//
//  Operation.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 15.08.2022.
//

 import Foundation

enum OperationState {
    case initial, computing, computed
}

class Operation {
    var id: Int = 0
    var name: String
    var output: String?
    var perform: () -> Void
    var state: OperationState = .initial
    init(id: Int = 0, name: String, performBlock: @escaping () -> Void) {
        self.id = id
        self.name = name
        self.perform = performBlock
    }
}


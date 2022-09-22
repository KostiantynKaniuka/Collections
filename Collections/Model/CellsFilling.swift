//
//  CellsStuffing.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 12.09.2022.
//

import Foundation

final class CellsFilling {
    let name: String
    let perform: () -> Void
    var output: String?
    var state: OperationStateSettings = .initiated
    
    init(name: String, performBlock: @escaping () -> Void) {
        self.name = name
        self.perform = performBlock
    }
}

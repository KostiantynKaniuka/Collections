//
//  CellsStuffing.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 12.09.2022.
//

import Foundation

class CellsFilling {
    let name: String
    let perform: () -> Void
    var id: Int = 0
    var output: String?
    var state: OperationStateSettings = .initial
    
    init(id: Int = 0, name: String, performBlock: @escaping () -> Void) {
        self.id = id
        self.name = name
        self.perform = performBlock
    }
  
}

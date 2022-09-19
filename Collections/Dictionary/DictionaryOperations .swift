//
//  DictionaryOperations .swift
//  Collections
//
//  Created by Константин Канюка on 18.08.2022.
//

import Foundation

class DictionaryOperations: CollectionOperations {
    
    func createArray() {
        perform(operation: contactArrayGeneration)
    }
    
    func createDictionary(completion: @escaping ((String?) -> Void)) {
        perform(operation: contactDictionaryGeneration, completion: { [weak self] in
            completion(self?.contactDictionaryGeneration.output)
        })
    }
    
    private var dictionaryManipulator = DictionaryManipulator()
    
    lazy var contactArrayGeneration: CellsFilling = { CellsFilling(name: "Generate contact array", performBlock: { self.dictionaryManipulator.contactArrayGenerator() }) }()
    
    lazy var contactDictionaryGeneration: CellsFilling = { CellsFilling(name: "Generate dictionary array", performBlock: { self.dictionaryManipulator.contactDictionaryGenetor() }) }()
    
    private lazy var operations: [CellsFilling] = {
        let operationsNamesAndBlocks: [Int: (String, () -> Void)] = [
            0: ("Find the first contact arr",
                { self.dictionaryManipulator.findTheFirstContactArray() }
               ),
            1: ("Find the first contact dict", { self.dictionaryManipulator.findTheFirstContactDictionary() }),
            2: ("Find the last contact arr", { self.dictionaryManipulator.findTheLastContactArray() }),
            3: ("Find the last contact dict", { self.dictionaryManipulator.findTheLastContactDictionary() }),
            4: ("Search for a non-existing element arr", { self.dictionaryManipulator.searchForANonExistingElementArray() }),
            5: ("Search for a non-existing element dict", { self.dictionaryManipulator.searchForANonExistingElementDictionary() })]
        
        var operationsList: [CellsFilling] = []
        var operationName: String?
        var operationBlock: (() -> Void)?
        for operationIndex in 0..<operationsNamesAndBlocks.count {
            (operationName, operationBlock) = operationsNamesAndBlocks[operationIndex]!
            let operation = CellsFilling(id: operationIndex, name: operationName!, performBlock: operationBlock!)
            operationsList.append(operation)
        }
        return operationsList
    }()
    
    lazy var operationsCount: Int = {
        operations.count
    }()
    
    func operationAtIndex(_ index: Int) -> CellsFilling {
        operations[index]
    }
}

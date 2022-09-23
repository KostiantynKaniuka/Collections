//
//  DictionaryOperations .swift
//  Collections
//
//  Created by Константин Канюка on 18.08.2022.
//

import Foundation

final class DictionaryCellActionLogic: CellPressingAction {
    lazy var operationsCount: Int = {
        operations.count
    }()
    
    private var dictionaryManipulator = DictionaryBuisnessLogic()

    private lazy var contactArrayGeneration: CellsFilling = {
        CellsFilling(
            name: "Generate contact array",
            performBlock: { [weak self] in self?.dictionaryManipulator.contactArrayGenerator() }) }()
    
    private lazy var contactDictionaryGeneration:
    CellsFilling = {
        CellsFilling(
            name: "Generate dictionary array",
            performBlock: { [weak self] in self?.dictionaryManipulator.contactDictionaryGenetor() }) }()
    
    private lazy var operations: [CellsFilling] = {
        [
            CellsFilling(name: "Find the first contact arr",
                         performBlock: { [weak self] in self?.dictionaryManipulator.findTheFirstContactArray() }),
            CellsFilling(name: "Find the first contact dict",
                         performBlock: { [weak self] in self?.dictionaryManipulator.findTheFirstContactDictionary() }),
            CellsFilling(name: "Find the last contact arr",
                         performBlock: { [weak self] in self?.dictionaryManipulator.findTheLastContactArray() }),
            CellsFilling(name: "Find the last contact dict",
                         performBlock: { [weak self] in self?.dictionaryManipulator.findTheLastContactDictionary() }),
            CellsFilling(name: "Search for a non-existing element arr",
                         performBlock: { [weak self] in self?.dictionaryManipulator.searchForANonExistingElementArray() }),
            CellsFilling(name: "Search for a non-existing element dict",
                         performBlock: { [weak self] in self?.dictionaryManipulator.searchForANonExistingElementDictionary() }),
        ]
    }()
    
    func createArray() {
        cellPressed(fillingInstance: contactArrayGeneration)
    }
    
    func createDictionary(completion: @escaping ((String?) -> Void)) {
        cellPressed(
            fillingInstance: contactDictionaryGeneration,
            completion: { [weak self] in completion(self?.contactDictionaryGeneration.output) })
    }
    
    func operationAtIndex(_ index: Int) -> CellsFilling {
        operations[index]
    }
}

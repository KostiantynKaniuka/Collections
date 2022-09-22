//
//  ArrayOperations .swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 15.08.2022.
//

import Foundation

final class ArrayCellCreationLogic: CellPressingAction {
    lazy var operationsCount: Int = {
        operations.count
    }()
    
    private let arrayManipulator = ArrayBuisnessLogic()
    private lazy var arrayCreatingOperation: CellsFilling = {
        CellsFilling(name: "Create Int array with 10_000_000 elements",
                     performBlock: { [weak self] in self?.arrayManipulator.arrayCreating()})
    }()
    private lazy var operations: [CellsFilling] = {
        [
            CellsFilling( name: "Insert 1000 elements at the beginning of the array one-by-one.",
                         performBlock: { [weak self] in self?.arrayManipulator.insertAtTheBeginningOneByOne() }),
            CellsFilling(name: "Insert 1000 elements at the beginning of the array.",
                         performBlock: { [weak self] in self?.arrayManipulator.insertAtTheBeginningAtOnce() }),
            CellsFilling(name: "Insert 1000 elements in the middle of the array one-by-one.",
                         performBlock: { [weak self] in self?.arrayManipulator.insertInTheMiddleOneByOne() }),
            CellsFilling(name: "Insert 1000 elements in the middle of the array.",
                         performBlock: { [weak self] in self?.arrayManipulator.insertInTheMiddleAtOnce() }),
            CellsFilling(name: "Insert 1000 elements at the end of the array one-by-one.",
                         performBlock: { [weak self] in self?.arrayManipulator.appendToTheEndOneByOne() }),
            CellsFilling(name: "Insert 1000 elements at the end of the array all at once.",
                         performBlock: { [weak self] in self?.arrayManipulator.appendToTheEndAtOnce() }),
            CellsFilling(name: "Remove 1000 elements at the end of the array one-by-one.",
                         performBlock: { [weak self] in self?.arrayManipulator.removeAtTheEndOneByOne() }),
            CellsFilling(name: "Remove 1000 elements at the end of the array.",
                         performBlock: { [weak self] in self?.arrayManipulator.removeAtTheEndAtOnce() }),
            CellsFilling(name: "Remove 1000 elements at the beginning of the array one-by-one.",
                         performBlock: { [weak self] in self?.arrayManipulator.removeAtTheBeginningOneByOne() }),
            CellsFilling(name: "Remove 1000 elements at the beginning of the array all at once.",
                         performBlock: { [weak self] in self?.arrayManipulator.removeAtTheBeginningAtOnce() }),
            CellsFilling(name: "Remove 1000 elements in the middle of the array one-by-one.",
                         performBlock: { [weak self] in self?.arrayManipulator.removeInTheMiddleOneByOne() }),
            CellsFilling(name: "Remove 1000 elements in the middle of the array.",
                         performBlock: { [weak self] in self?.arrayManipulator.removeInTheMiddleAtOnce() })
        ]
    }()
    
    func create(completion: @escaping ((String?) -> Void)) {
        cellPressed(fillingInstance: arrayCreatingOperation,
                    completion: {[weak self] in completion(self?.arrayCreatingOperation.output)})
    }
    
    func operationAtIndex(_ index: Int) -> CellsFilling? {
        let isIndexValid = operations.indices.contains(index)
        if isIndexValid == true {
            return operations[index]
        } else {
            return nil
        }
    }
}

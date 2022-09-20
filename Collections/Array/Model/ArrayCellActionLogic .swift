//
//  ArrayOperations .swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 15.08.2022.
//

import Foundation

class ArrayCellCreationLogic: CellPressingAction {
    private let arrayManipulator = ArrayBuisnessLogic()
    lazy var operationsCount: Int = {
        operations.count
    }()
    
    private lazy var arrayCreatingOperation: CellsFilling = {
        CellsFilling(name: "Create Int array with 10_000_000 elements", performBlock: {
            [weak self] in self?.arrayManipulator.arrayCreating()
        })
    }()
    
    private lazy var operations: [CellsFilling] = {
        [
            CellsFilling(id: 0, name: "Insert 1000 elements at the beginning of the array one-by-one.", performBlock: { [weak self] in self?.arrayManipulator.insertAtTheBeginningOneByOne() }),
            CellsFilling(id: 1, name: "Insert 1000 elements at the beginning of the array.", performBlock: { [weak self] in self?.arrayManipulator.insertAtTheBeginningAtOnce() }),
            CellsFilling(id: 2, name: "Insert 1000 elements in the middle of the array one-by-one.", performBlock: { [weak self] in self?.arrayManipulator.insertInTheMiddleOneByOne() }),
            CellsFilling(id: 3, name:  "Insert 1000 elements in the middle of the array.", performBlock: { [weak self] in self?.arrayManipulator.insertInTheMiddleAtOnce() }),
            CellsFilling(id: 4, name: "Insert 1000 elements at the end of the array one-by-one.", performBlock: { [weak self] in self?.arrayManipulator.appendToTheEndOneByOne() }),
            CellsFilling(id: 5, name: "Insert 1000 elements at the end of the array all at once.", performBlock: { [weak self] in self?.arrayManipulator.appendToTheEndAtOnce() }),
            CellsFilling(id: 6, name: "Remove 1000 elements at the end of the array one-by-one.", performBlock: { [weak self] in self?.arrayManipulator.removeAtTheEndOneByOne() }),
            CellsFilling(id: 7, name:  "Remove 1000 elements at the end of the array.", performBlock: { [weak self] in self?.arrayManipulator.removeAtTheEndAtOnce() }),
            CellsFilling(id: 8, name:  "Remove 1000 elements at the beginning of the array one-by-one.", performBlock: { [weak self] in self?.arrayManipulator.removeAtTheBeginningOneByOne() }),
            CellsFilling(id: 9, name: "Remove 1000 elements at the beginning of the array all at once.", performBlock: { [weak self] in self?.arrayManipulator.removeAtTheBeginningAtOnce() }),
            CellsFilling(id: 10, name: "Remove 1000 elements in the middle of the array one-by-one.", performBlock: { [weak self] in self?.arrayManipulator.removeInTheMiddleOneByOne() }),
            CellsFilling(id: 11, name:  "Remove 1000 elements in the middle of the array.", performBlock: { [weak self] in self?.arrayManipulator.removeInTheMiddleAtOnce() })
        ]
    }()
    
    func create(completion: @escaping ((String?) -> Void)) {
        cellPressed(fillingInstance: arrayCreatingOperation, completion: {[weak self] in
            completion(self?.arrayCreatingOperation.output)})
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

//
//  ArrayOperations .swift
//  Collections
//
//  Created by Константин Канюка on 15.08.2022.
//

import Foundation

class ArrayOperations: CollectionOperations {
    
    func create(completion: @escaping ((String?) -> Void)) {
        perform(operation: arrayCreatingOperation, completion: { [weak self] in
            completion(self?.arrayCreatingOperation.output)
        })
    }
    
    private var arrayManipulator = ArrayManipulator()
    
    private lazy var arrayCreatingOperation: CellsFilling = {
        CellsFilling(name: "Create Int array with 10_000_000 elements", performBlock: {
            self.arrayManipulator.arrayCreating()
        })
    }()
    
    private lazy var operations: [CellsFilling] = {
        [
            CellsFilling(id: 0, name: "Insert 1000 elements at the beginning of the array one-by-one.", performBlock: { self.arrayManipulator.insertAtTheBeginningOneByOne() }),
            CellsFilling(id: 1, name: "Insert 1000 elements at the beginning of the array.", performBlock: { self.arrayManipulator.insertAtTheBeginningAtOnce() }),
            CellsFilling(id: 2, name: "Insert 1000 elements in the middle of the array one-by-one.", performBlock: { self.arrayManipulator.insertInTheMiddleOneByOne() }),
            CellsFilling(id: 3, name:  "Insert 1000 elements in the middle of the array.", performBlock: { self.arrayManipulator.insertInTheMiddleAtOnce() }),
            CellsFilling(id: 4, name: "Insert 1000 elements at the end of the array one-by-one.", performBlock: { self.arrayManipulator.appendToTheEndOneByOne() }),
            CellsFilling(id: 5, name: "Insert 1000 elements at the end of the array all at once.", performBlock: { self.arrayManipulator.appendToTheEndAtOnce() }),
            CellsFilling(id: 6, name: "Remove 1000 elements at the end of the array one-by-one.", performBlock: { self.arrayManipulator.removeAtTheEndOneByOne() }),
            CellsFilling(id: 7, name:  "Remove 1000 elements at the end of the array.", performBlock: { self.arrayManipulator.removeAtTheEndAtOnce() }),
            CellsFilling(id: 8, name:  "Remove 1000 elements at the beginning of the array one-by-one.", performBlock: { self.arrayManipulator.removeAtTheBeginningOneByOne() }),
            CellsFilling(id: 9, name: "Remove 1000 elements at the beginning of the array all at once.", performBlock: { self.arrayManipulator.removeAtTheBeginningAtOnce() }),
            CellsFilling(id: 10, name: "Remove 1000 elements in the middle of the array one-by-one.", performBlock: { self.arrayManipulator.removeInTheMiddleOneByOne() }),
            CellsFilling(id: 11, name:  "Remove 1000 elements in the middle of the array.", performBlock: { self.arrayManipulator.removeInTheMiddleAtOnce() })
        ]
    }()
    
    lazy var operationsCount: Int = {
        operations.count
    }()
    
    func operationAtIndex(_ index: Int) -> CellsFilling {
        operations[index]
    }
}

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
    
    private lazy var arrayCreatingOperation: Operation = {
        Operation(name: "Create Int array with 10_000_000 elements", performBlock: {
            self.arrayManipulator.arrayCreating()
        })
    }()
    
    private lazy var operations: [Operation] = {
        [
            Operation(id: 0, name: "Insert 1000 elements at the beginning of the array one-by-one.", performBlock: { self.arrayManipulator.insertAtTheBeginningOneByOne() }),
            Operation(id: 1, name: "Insert 1000 elements at the beginning of the array.", performBlock: { self.arrayManipulator.insertAtTheBeginningAtOnce() }),
            Operation(id: 2, name: "Insert 1000 elements in the middle of the array one-by-one.", performBlock: { self.arrayManipulator.insertInTheMiddleOneByOne() }),
            Operation(id: 3, name:  "Insert 1000 elements in the middle of the array.", performBlock: { self.arrayManipulator.insertInTheMiddleAtOnce() }),
            Operation(id: 4, name: "Insert 1000 elements at the end of the array one-by-one.", performBlock: { self.arrayManipulator.appendToTheEndOneByOne() }),
            Operation(id: 5, name: "Insert 1000 elements at the end of the array all at once.", performBlock: { self.arrayManipulator.appendToTheEndAtOnce() }),
            Operation(id: 6, name: "Remove 1000 elements at the end of the array one-by-one.", performBlock: { self.arrayManipulator.removeAtTheEndOneByOne() }),
            Operation(id: 7, name:  "Remove 1000 elements at the end of the array.", performBlock: { self.arrayManipulator.removeAtTheEndAtOnce() }),
            Operation(id: 8, name:  "Remove 1000 elements at the beginning of the array one-by-one.", performBlock: { self.arrayManipulator.removeAtTheBeginningOneByOne() }),
            Operation(id: 9, name: "Remove 1000 elements at the beginning of the array all at once.", performBlock: { self.arrayManipulator.removeAtTheBeginningAtOnce() }),
            Operation(id: 10, name: "Remove 1000 elements in the middle of the array one-by-one.", performBlock: { self.arrayManipulator.removeInTheMiddleOneByOne() }),
            Operation(id: 11, name:  "Remove 1000 elements in the middle of the array.", performBlock: { self.arrayManipulator.removeInTheMiddleAtOnce() })
        ]
    }()
    
    lazy var operationsCount: Int = {
        operations.count
    }()
    
    func operationAtIndex(_ index: Int) -> Operation {
        operations[index]
    }
}

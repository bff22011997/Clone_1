//
//  Variable.swift
//  Project_1
//
//  Created by Trung Kiên on 11/23/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

class Variable<T> {
    var value: T {
        didSet {
            if let handle = self.handle {
                handle(value)
            }
        }
    }
    
    var handle: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ handle: @escaping (T) -> Void) {
        self.handle = handle
        if let handle = self.handle {
            handle(value)
        }
    }
}

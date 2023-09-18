//
//  Observable.swift
//  MVVMWithDiffable
//
//  Created by 권현석 on 2023/09/18.
//

import Foundation

class Observable<T> {
    
    var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
    
}

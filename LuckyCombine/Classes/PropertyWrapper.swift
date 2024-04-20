//
//  PropertyWrapper.swift
//  LuckyCombine
//
//  Created by junky on 2024/4/20.
//

import Foundation
import Combine



@propertyWrapper
public struct CurrentValueSubjectProperty<T> {
    
    public var wrappedValue: T {
        set {
            value = newValue
        }
        get {
            value
        }
    }
    
    public var projectedValue: CurrentValueSubject<T, Never>
    
    private var value: T {
        didSet {
            projectedValue.send(value)
        }
    }
    
    public init(wrappedValue: T) {
        self.value = wrappedValue
        self.projectedValue = CurrentValueSubject<T, Never>(wrappedValue)
    }
    
}



@propertyWrapper
public struct PassthroughSubjectProperty<T> {
    
    public var wrappedValue: T {
        set {
            value = newValue
        }
        get {
            value
        }
    }

    public var projectedValue: PassthroughSubject<T, Never>
    
    var value: T {
        didSet {
            projectedValue.send(value)
        }
    }
    
    
    public init(wrappedValue: T) {
        self.value = wrappedValue
        self.projectedValue = PassthroughSubject<T, Never>()
    }
}






@propertyWrapper
public struct CurrentValueOnChangeSubjectProperty<T: Equatable> {
    
    public var wrappedValue: T {
        set {
            value = newValue
        }
        get {
            value
        }
    }
    
    public var projectedValue: CurrentValueSubject<T, Never>
    
    private var value: T {
        didSet {
            if value == oldValue {
                return
            }
            projectedValue.send(value)
        }
    }
    
    public init(wrappedValue: T) {
        self.value = wrappedValue
        self.projectedValue = CurrentValueSubject<T, Never>(wrappedValue)
    }
    
}



@propertyWrapper
public struct PassthroughOnChangeSubjectProperty<T: Equatable> {
    
    public var wrappedValue: T {
        set {
            value = newValue
        }
        get {
            value
        }
    }

    public var projectedValue: PassthroughSubject<T, Never>
    
    var value: T {
        didSet {
            if value == oldValue {
                return
            }
            projectedValue.send(value)
        }
    }
    
    
    public init(wrappedValue: T) {
        self.value = wrappedValue
        self.projectedValue = PassthroughSubject<T, Never>()
    }
}






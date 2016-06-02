//
//  Array+Extras.swift
//  SwiftExtensions
//
//  Created by Anton Doudarev on 6/1/16.
//  Copyright © 2016 Anton Doudarev. All rights reserved.
//
import Foundation

extension Array where Element : Equatable {
   
    mutating func removeObject(object : Generator.Element) {
        if let index = indexOf(object) {
            removeAtIndex(index)
        }
    }
    
    func contains<T where T : Equatable>(obj: T) -> Bool {
        return filter({$0 as? T == obj}).count > 0
    }
}
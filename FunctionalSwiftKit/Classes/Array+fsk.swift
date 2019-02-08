//  BSD 2-Clause License
//
//  Copyright (c) 2019, Steve Kim
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  Array+fsk.swift
//  FunctionalSwiftKit
//
//  Created by Steve Kim on 08/02/2019.
//

import Foundation

extension Array where Element: Hashable {
    
    // source -> ["A", "A", "B", "C"], key -> { $0 }
    // result -> ["A": ["A", "A"], "B": ["B"], "C": ["C"]]
    public func grouped<T: Hashable>(_ key: (Element) -> T) -> [T: [Element]] {
        var result = [T: [Element]]()
        forEach {
            let key = key($0)
            var array = result[key] ?? []
            array.append($0)
            result[key] = array
        }
        return result
    }
    
    // source -> ["A", "A", "B", "C"], other -> ["B", "C"]
    // result -> ["A", "A"]
    public func subtracted(_ other: [Element]) -> [Element] {
        let set = NSMutableSet(array: self)
        set.minus(Set<Element>(other))
        return set.compactMap { $0 as? Element }
    }
    
    // source -> ["A", "A", "B", "C"]
    // result -> ["A", "B", "C"]
    public func uniqued() -> [Element] {
        var set = Set<Element>()
        return compactMap { set.insert($0).inserted ? $0 : nil }
    }
}

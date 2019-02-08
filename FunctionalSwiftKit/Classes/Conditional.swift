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
//  Conditional.swift
//  FunctionalSwiftKit
//
//  Created by Steve Kim on 08/02/2019.
//

import Foundation

public enum Conditional {
    case none
    case some
    
    public typealias Execution = () -> Void
    
    public init(_ isValid: Bool) {
        self = isValid ? .some : .none
    }
    
    @discardableResult
    public func `if`(_ isValid: Bool, _ execution: Execution) -> Conditional {
        let con = Conditional(isValid)
        if con == .some {
            execution()
        }
        return con
    }
    @discardableResult
    public func `else`(_ execution: Execution) -> Conditional {
        if self == .none {
            execution()
        }
        return .none
    }
    @discardableResult
    public func elseif(_ isValid: Bool, _ execution: Execution) -> Conditional {
        if self == .none && isValid {
            execution()
        }
        return self == .none && !isValid ? .none : .some
    }
}

public var condition: Conditional {
    return Conditional(true)
}

//
//  Describable.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/31/24.
//

import Foundation

open class Describable {

    var description: String { "superclass description" }

    // It is ok for this function to be static since each attribute should only
    // ever have one description.
    static func describe(_ attr: Describable) -> String {
        attr.description
    }
}

protocol DescribableProtocol {

    static func describe(_ attr: String) -> String
    
}

extension DescribableProtocol {
    var description: String { "protocol level - should not be called" }
}

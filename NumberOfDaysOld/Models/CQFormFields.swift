//
//  CQFormFields.swift
//  NumberOfDaysOld
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import Foundation

struct CQFormFields
{
    let title:String
    private(set) var value:String
    let type: CQEnums.CQFormFieldType
    private(set) var order:Int
    
    mutating func setValue(_ newValue: String)
    {
        self.value = newValue
    }
    
    mutating func setOrder(_ newOrder: Int)
    {
        self.order = newOrder
    }
}

extension CQFormFields: Equatable
{
    static func == (lhs: CQFormFields, rhs: CQFormFields) -> Bool
    {
        if lhs.title == rhs.title &&
        lhs.type == rhs.type &&
        lhs.value == rhs.value
        {
            return true
        }
        else
        {
            return false
        }
    }
}

extension CQFormFields: Hashable
{
    var hashValue: Int
    {
        return (title + value + type.rawValue).hashValue
    }
}

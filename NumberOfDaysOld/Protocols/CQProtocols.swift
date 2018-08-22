//
//  CQProtocols.swift
//  NumberOfDaysOld
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import Foundation

//MARK: -  Class idetifiers Propagation
protocol CQClassIdentifier
{
    static var identifier:String {get}
}

extension CQClassIdentifier
{
    private static var className: String
    {
        return String.init(describing: self)
    }
    
    static var identifier: String
    {
        return self.className + "ID"
    }
    
    static var trimmedIdentifier: String
    {
         return self.className
    }
}


//MARK: -  Generic Change Propagation
protocol CQValueChangePropagator
{
    func coercedTypes() -> Array<Any>
    func changedValue<Value>(coercedTo type:Value.Type) -> Value?
    func changedValue() -> Any
}

protocol CQValueChangePropagatorChangeSingal
{
    func value<Source:CQValueChangePropagator,Component>(
        of component:Component ,
        changedAt source:Source
    )
}

// to be used in classes with weak moniker
protocol CQValueChangePropagatorDelegate:class , CQValueChangePropagatorChangeSingal
{
}

protocol CQFormFieldIdentifier: class
{
    var formFieldIdentifier:String {get set}
}

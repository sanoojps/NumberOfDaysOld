//
//  CQEnums.swift
//  NumberOfDaysOld
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import Foundation

struct CQEnums
{
    enum CQFormFieldType:String
    {
        case input
        case choice
        case `default`
    }
}

extension CQEnums
{
    enum CQLocalizedKeys: String
    {
        case FIRST_NAME
        case LAST_NAME
        case DATE_OF_BIRTH
        case GENDER
        
        enum Gender: String
        {
            case MALE
            case FEMALE
            
            enum Salutaion: String
            {
                case MISTER
                case MISS
            }
        }
        
        enum DatePickerToolbarTitle: String
        {
            case DONE
            case CANCEL
        }
        
        enum ERROR: String
        {
            case INCOMPLETE
        }
        
        enum GREETING: String
        {
            case BIRTHDAY_GREETING_FORMAT
        }
    }
    
    enum CQLocalizedKeysOrder: Int
    {
        case FIRST_NAME
        case LAST_NAME
        case DATE_OF_BIRTH
        case GENDER
    }
}



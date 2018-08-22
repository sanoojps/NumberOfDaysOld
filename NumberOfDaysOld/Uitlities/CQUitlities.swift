//
//  CQUitlities.swift
//  NumberOfDaysOld
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import Foundation

struct Utils {
    
    
    private init() {}
    
    
    static func getBirthdayMessage(values:[String:CQFormFields])  -> String {
        
        let firstName =
            values[String(CQEnums.CQLocalizedKeysOrder.FIRST_NAME.rawValue)]?.value ?? ""
        
        let lastName =
            values[String(CQEnums.CQLocalizedKeysOrder.LAST_NAME.rawValue)]?.value ?? ""
        
        let dob =
            values[String(CQEnums.CQLocalizedKeysOrder.DATE_OF_BIRTH.rawValue)]?.value ?? ""
        
        let genderString =
            values[String(CQEnums.CQLocalizedKeysOrder.GENDER.rawValue)]?.value
        
        let gender =
        { gender -> String in
            switch gender {
            case CQEnums.CQLocalizedKeys.Gender.MALE.rawValue.localized:
                return CQEnums.CQLocalizedKeys.Gender.Salutaion.MISTER.rawValue.localized
                
            case CQEnums.CQLocalizedKeys.Gender.FEMALE.rawValue.localized:
                return CQEnums.CQLocalizedKeys.Gender.Salutaion.MISS.rawValue.localized
                
            default:
                return ""
            }
        }(genderString)
        
        guard let validDate = checkDateValidity(dob) else
        {
            return CQEnums.CQLocalizedKeys.ERROR.INCOMPLETE.rawValue
            
        }
        
        let daysOld = String(getDaysOld(date: validDate))
        
        return String.init(
            format: CQEnums.CQLocalizedKeys.GREETING.BIRTHDAY_GREETING_FORMAT.rawValue.localized,
            gender,
            firstName,
            lastName,
            dob,
            daysOld
        )
        
    }
    
    
    //Check date validity
    static func checkDateValidity(_ dateString: String) -> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: dateString)
    }
    
    static func getDaysOld(date: Date) -> Int {
        
        let cal = Calendar.current
        let dob = cal.startOfDay(for: date)
        let today = cal.startOfDay(for: Date())
        let diff = cal.dateComponents([.day], from: dob, to: today)
        return diff.day ?? 0
    }
}

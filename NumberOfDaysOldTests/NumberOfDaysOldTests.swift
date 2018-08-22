//
//  NumberOfDaysOldTests.swift
//  NumberOfDaysOldTests
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import XCTest
@testable import NumberOfDaysOld

class NumberOfDaysOldTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

extension NumberOfDaysOldTests
{
    func testMessage_isValid() {
        let data:[String:CQFormFields]  =
            [
                String(CQEnums.CQLocalizedKeysOrder.FIRST_NAME.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.FIRST_NAME.rawValue.localized,
                        value: "Madhur",
                        type: CQEnums.CQFormFieldType.input,
                        order: CQEnums.CQLocalizedKeysOrder.FIRST_NAME.rawValue
                ),
                
                String(CQEnums.CQLocalizedKeysOrder.LAST_NAME.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.LAST_NAME.rawValue.localized,
                        value: "Mohta",
                        type: CQEnums.CQFormFieldType.input,
                        order: CQEnums.CQLocalizedKeysOrder.LAST_NAME.rawValue
                ),
                
                String(CQEnums.CQLocalizedKeysOrder.DATE_OF_BIRTH.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.DATE_OF_BIRTH.rawValue.localized,
                        value: "16/08/2017",
                        type: CQEnums.CQFormFieldType.input,
                        order: CQEnums.CQLocalizedKeysOrder.DATE_OF_BIRTH.rawValue
                ),
                
                String(CQEnums.CQLocalizedKeysOrder.GENDER.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.GENDER.rawValue.localized,
                        value: CQEnums.CQLocalizedKeys.Gender.MALE.rawValue.localized,
                        type: CQEnums.CQFormFieldType.choice,
                        order: CQEnums.CQLocalizedKeysOrder.GENDER.rawValue
                ),
                ]
        

        let message = Utils.getBirthdayMessage(values: data)
        
//        let firstName = data[String(CQEnums.CQLocalizedKeysOrder.FIRST_NAME.rawValue)]?.value ?? ""
//        let lastName = data[String(CQEnums.CQLocalizedKeysOrder.LAST_NAME.rawValue)]?.value ?? ""
//        let dob = data[String(CQEnums.CQLocalizedKeysOrder.DATE_OF_BIRTH.rawValue)]?.value ?? ""
//
//        let genderString = data[String(CQEnums.CQLocalizedKeysOrder.GENDER.rawValue)]?.value
//
//        let gender =
//        { gender -> String in
//            switch gender {
//            case CQEnums.CQLocalizedKeys.Gender.MALE.rawValue.localized:
//                return CQEnums.CQLocalizedKeys.Gender.Salutaion.MISTER.rawValue.localized
//
//            case CQEnums.CQLocalizedKeys.Gender.FEMALE.rawValue.localized:
//                return CQEnums.CQLocalizedKeys.Gender.Salutaion.MISS.rawValue.localized
//
//            default:
//                return ""
//            }
//        }(genderString)
//
//        guard let validDate = Utils.checkDateValidity(dob) else
//        {
//            return //CQEnums.CQLocalizedKeys.ERROR.INCOMPLETE.rawValue
//
//        }
//
//        let daysOld = String(Utils.getDaysOld(date: validDate))
//
//        print(String.init(
//            format: CQEnums.CQLocalizedKeys.GREETING.BIRTHDAY_GREETING_FORMAT.rawValue.localized,
//            gender ,
//            firstName ,
//            lastName ,
//            dob ,
//            daysOld
//        )
//        )
        
        XCTAssertEqual(message, "Hi Madhur Mohta, you are born on 16/08/2017. You are exactly 371 days old")
        
    }
    
    func testMessage_isInValid() {
        
        let data:[String:CQFormFields]  =
            [
                String(CQEnums.CQLocalizedKeysOrder.FIRST_NAME.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.FIRST_NAME.rawValue.localized,
                        value: "Madhur",
                        type: CQEnums.CQFormFieldType.input,
                        order: CQEnums.CQLocalizedKeysOrder.FIRST_NAME.rawValue
                ),
                
                String(CQEnums.CQLocalizedKeysOrder.LAST_NAME.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.LAST_NAME.rawValue.localized,
                        value: "Mohta",
                        type: CQEnums.CQFormFieldType.input,
                        order: CQEnums.CQLocalizedKeysOrder.LAST_NAME.rawValue
                ),
                
                String(CQEnums.CQLocalizedKeysOrder.DATE_OF_BIRTH.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.DATE_OF_BIRTH.rawValue.localized,
                        value: "16/08/234234",
                        type: CQEnums.CQFormFieldType.input,
                        order: CQEnums.CQLocalizedKeysOrder.DATE_OF_BIRTH.rawValue
                ),
                
                String(CQEnums.CQLocalizedKeysOrder.GENDER.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.GENDER.rawValue.localized,
                        value: "Mr",
                        type: CQEnums.CQFormFieldType.choice,
                        order: CQEnums.CQLocalizedKeysOrder.GENDER.rawValue
                ),
                ]
                
         let message = Utils.getBirthdayMessage(values: data)
        
        XCTAssertEqual(message, "I'm sorry, not all your input was valid")
        
    }
    
    func testNoOfDays() {
        
        let dateObj = Date()
        
        let no = Utils.getDaysOld(date: dateObj)
        
        XCTAssertEqual(no, 0)
    }
    
    func testDateValidity() {
        
        let dateString = "27/12/1989"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateObj = dateFormatter.date(from: dateString)
        
        XCTAssertNotNil(dateObj)
    }
    
    func testDateInValidity() {
        
        let dateString = "27/24/2009"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateObj = dateFormatter.date(from: dateString)
        
        XCTAssertNil(dateObj)
    }
}

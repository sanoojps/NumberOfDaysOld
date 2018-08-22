//
//  CQExtensions.swift
//  NumberOfDaysOld
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import Foundation

// MARK: - String Extensions
extension String
{
    var localized: String
    {
        return NSLocalizedString(
            self,
            comment: ""
        )
    }
}

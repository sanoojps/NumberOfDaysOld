//
//  CQBaseTableViewCell.swift
//  NumberOfDaysOld
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import UIKit

class CQBaseTableViewCell: UITableViewCell, CQClassIdentifier, CQFormFieldIdentifier, CQValueChangePropagator {
   
    private(set) var formFieldType: CQEnums.CQFormFieldType = .default
    var formFieldIdentifier: String = String(CQEnums.CQLocalizedKeysOrder.FIRST_NAME.rawValue)
    
    weak var changePropagationDelegate: CQValueChangePropagatorDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: CQValueChangePropagator
    func coercedTypes() -> Array<Any> {
        return []
    }
    
    func changedValue<Value>(coercedTo type: Value.Type) -> Value?
    {
        return nil
    }
    
    func changedValue() -> Any {
        return ""
    }
}




//
//  CQFormFieldChoiceTableViewCell.swift
//  NumberOfDaysOld
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import UIKit

class CQFormFieldChoiceTableViewCell: CQBaseTableViewCell {

    @IBOutlet weak var formFieldChoiceTitle: UILabel!
    @IBOutlet weak var formFieldChoiceSegment: UISegmentedControl!
    
    override var formFieldType: CQEnums.CQFormFieldType
    {
        return .choice
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func coercedTypes() -> Array<Any> {
        return [String.self]
    }
    
    override func changedValue<Value>(coercedTo type: Value.Type) -> Value? {
        return self.formFieldChoiceSegment.titleForSegment(
            at: self.formFieldChoiceSegment?.selectedSegmentIndex ?? 0
            ) as? Value
    }

    @IBAction func choiceSegmentIndexDidChange(_ sender: UISegmentedControl)
    {
        self.changePropagationDelegate?.value(of: self.formFieldChoiceSegment, changedAt: self)
    }
}

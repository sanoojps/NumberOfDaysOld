//
//  CQFormFieldInputTableViewCell.swift
//  NumberOfDaysOld
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import UIKit

class CQFormFieldInputTableViewCell: CQBaseTableViewCell {

    @IBOutlet weak var formFieldInputTitle: UILabel!
    @IBOutlet weak var formFieldInputValue: UITextField!
    
    private(set) var replacementString:String = ""
    
    var datePicker: UIDatePicker? = nil
    
    override var formFieldType: CQEnums.CQFormFieldType
    {
        return .input
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.formFieldInputValue.delegate =
        self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func coercedTypes() -> Array<Any> {
        return [String.self,Int.self]
    }
    
    override func changedValue<Value>(coercedTo type: Value.Type) -> Value?
    {
        //Coercion
        switch type {
        case is String.Type:
            return self.replacementString as? Value
        case is Int.Type:
            return Int(self.replacementString) as? Value
        default:
            return nil
        }
    }
    
    //raw
    override func changedValue() -> Any
    {
        return self.formFieldInputValue.text as Any
    }
    
    override func prepareForReuse() {
        
        self.datePicker =
        nil
        
    }
}


extension CQFormFieldInputTableViewCell: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        self.replacementString = string
        
        self.changePropagationDelegate?.value(of: self.formFieldInputValue, changedAt: self)
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if self.formFieldIdentifier == String(CQEnums.CQLocalizedKeysOrder.DATE_OF_BIRTH.rawValue)
        {
            self.presentDatePicker(textField: textField)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.resignFirstResponder()
    }
}

extension CQFormFieldInputTableViewCell
{
    func presentDatePicker(textField:UITextField) {
        
        //Formate Date
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton =
            UIBarButtonItem(
                title: CQEnums.CQLocalizedKeys.DatePickerToolbarTitle.DONE.rawValue.localized,
                style: .plain,
                target: self, action: #selector(doneBtnDownFromDatePicker)
        );
        
        let spaceButton =
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let cancelButton =
            UIBarButtonItem(title:
                CQEnums.CQLocalizedKeys.DatePickerToolbarTitle.CANCEL.rawValue.localized,
                            style: .plain,
                            target: self,
                            action: #selector(cancelBtnDownFromDatePicker)
        )
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        // add toolbar to textField
        textField.inputAccessoryView = toolbar
        
        // add datepicker to textField
        textField.inputView = datePicker
        
        
    }
    
    @objc func doneBtnDownFromDatePicker()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        formFieldInputValue.text = formatter.string(from: (datePicker?.date) ?? Date())
        
        self.endEditing(true)
    }
    
    @objc func cancelBtnDownFromDatePicker()
    {
        self.endEditing(true)
    }
}


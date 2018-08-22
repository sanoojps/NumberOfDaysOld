//
//  CQFormTableViewController.swift
//  NumberOfDaysOld
//
//  Created by Sanooj on 22/08/2018.
//  Copyright © 2018 Sanooj. All rights reserved.
//

import UIKit

class CQFormTableViewController: UITableViewController {
    
    var dataSourceCollection:[String:CQFormFields] = [:]

    func makeData() -> [String:CQFormFields]
    {
        let data:[String:CQFormFields]  =
                [
                    String(CQEnums.CQLocalizedKeysOrder.FIRST_NAME.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.FIRST_NAME.rawValue.localized,
                        value: "",
                        type: CQEnums.CQFormFieldType.input,
                        order: CQEnums.CQLocalizedKeysOrder.FIRST_NAME.rawValue
                    ),
                        
                    String(CQEnums.CQLocalizedKeysOrder.LAST_NAME.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.LAST_NAME.rawValue.localized,
                        value: "",
                        type: CQEnums.CQFormFieldType.input,
                        order: CQEnums.CQLocalizedKeysOrder.LAST_NAME.rawValue
                    ),
                        
                    String(CQEnums.CQLocalizedKeysOrder.DATE_OF_BIRTH.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.DATE_OF_BIRTH.rawValue.localized,
                        value: "",
                        type: CQEnums.CQFormFieldType.input,
                        order: CQEnums.CQLocalizedKeysOrder.DATE_OF_BIRTH.rawValue
                    ),
                        
                    String(CQEnums.CQLocalizedKeysOrder.GENDER.rawValue) :
                    CQFormFields(
                        title: CQEnums.CQLocalizedKeys.GENDER.rawValue.localized,
                        value: "",
                        type: CQEnums.CQFormFieldType.choice,
                        order: CQEnums.CQLocalizedKeysOrder.GENDER.rawValue
                    ),
                    ]
        
        return data
    }
    
    @IBAction func onSubmitButtonDown(_ sender: UIBarButtonItem) {
        
        print(Utils.getBirthdayMessage(values: self.dataSourceCollection))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.dataSourceCollection =
        self.makeData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.dataSourceCollection.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // Configure the cell...
        let defaultCell = UITableViewCell()
        
        guard let formfield = self.dataSourceCollection[String(indexPath.section)] else
        {
            return defaultCell
        }
        
        switch formfield.type {
            
        case .choice:
            if let cell:CQFormFieldChoiceTableViewCell =
                tableView.dequeueReusableCell(
                    withIdentifier: CQFormFieldChoiceTableViewCell.identifier,
                    for: indexPath
                    ) as? CQFormFieldChoiceTableViewCell
            {
                
                cell.formFieldChoiceTitle.text =
                formfield.title
                
                cell.formFieldIdentifier =
                String(formfield.order)
                
                cell.changePropagationDelegate =
                self
                
                cell.formFieldChoiceSegment.setTitle(
                    CQEnums.CQLocalizedKeys.Gender.MALE.rawValue.localized,
                    forSegmentAt: 0
                )
               
                cell.formFieldChoiceSegment.setTitle(
                    CQEnums.CQLocalizedKeys.Gender.FEMALE.rawValue.localized,
                    forSegmentAt: 1
                )
                
                return cell
            }
            
        case .input:
            if let cell:CQFormFieldInputTableViewCell =
                tableView.dequeueReusableCell(
                    withIdentifier: CQFormFieldInputTableViewCell.identifier,
                    for: indexPath
                    ) as? CQFormFieldInputTableViewCell
            {
                cell.formFieldInputTitle.text =
                formfield.title
                
                cell.formFieldIdentifier =
                String(formfield.order)
                
                cell.changePropagationDelegate =
                self
                
                return cell
            }
            
        default:
            return defaultCell
            
        }
        
        return defaultCell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension CQFormTableViewController:CQValueChangePropagatorDelegate
{
    func value<Source, Component>(of component: Component, changedAt source: Source) where Source : CQValueChangePropagator {
        
        // check if object confirms to formfield identifier
        guard let sourceId = source as? CQFormFieldIdentifier else
        {
            return
        }
        
        // update data Source
        guard var formfield =
            self.dataSourceCollection[sourceId.formFieldIdentifier] else
        {
            return
        }
       
        print(source.coercedTypes())
        
        
        for coercedType in source.coercedTypes()
        {
            switch coercedType
            {
            case is String.Type:
                
                guard let change: String =
                    source.changedValue(coercedTo: String.self) else
                {
                    return
                }
                
                //let currentValue = formfield.value
                formfield.setValue(change)
                
                self.dataSourceCollection[sourceId.formFieldIdentifier] =
                formfield
                
                break
                
            case is Int.Type:
                
                guard let change: String =
                    source.changedValue(coercedTo: String.self) else
                {
                    return
                }
            
                formfield.setValue(change)
                
                self.dataSourceCollection[sourceId.formFieldIdentifier] =
                formfield
                
                
                break
            default:
                break
            }
        }
    
    }

}


extension CQClassIdentifier
{
}

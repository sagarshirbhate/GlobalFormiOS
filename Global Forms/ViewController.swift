//
//  ViewController.swift
//  Global Forms
//
//  Created by Sagar Shirbhate on 7/26/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

import UIKit
import Eureka
import CoreLocation

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If Any Url Row Came Then The Color of Url Should Be changed
        URLRow.defaultCellUpdate = { cell, row in cell.textField.textColor = .blueColor() }
        
        /// Simple row that can show title and value but is not editable by user.
        LabelRow.defaultCellUpdate = { cell, row in cell.detailTextLabel?.textColor = .orangeColor()  }
        
        //Boolean Row
        CheckRow.defaultCellSetup = { cell, row in cell.tintColor = .orangeColor() }
        
        // Date Row set default Date
        DateRow.defaultRowInitializer = { row in row.minimumDate = NSDate() }
        
        
        let section = Section("Form Row Types") // If you want to make Section Then Use it OtherWise just initialize dont assign any name to form
        
        //Label Row
        section.append( LabelRow()
            {
                $0.title="LabelRow" //set title
                $0.value="Tap label" // set value
                $0.onCellSelection({ (cell, row) in
                    row.title = (row.title ?? "") + "  S  "
                    row.reload() // or row.updateCell()
                })
            })
    

        //Text Row in two ways
         section.append(TextRow() {$0.placeholder = "Simple Text Row" } )
         section.append(TextRow()
            {
                $0.title = "Simple Text Row"
                $0.placeholder = "placeholder"
            } )
        
        
        
        // Decimal Row
        section.append(DecimalRow()
            {
                $0.title = "DecimalRow"
                $0.value = 0 // By default set Value
                $0.formatter = DecimalFormatter() // Assigned decimal Formatter
                $0.useFormatterDuringInput = true // Use Formatter while entering Values
               //$0.useFormatterOnDidBeginEditing = true
                $0.cellSetup({ (cell, row) in
                    cell.textField.keyboardType = .NumberPad
                })
            })
        
        
        //Int Row
        section.append(IntRow()
            {
                $0.title = "Int Row"
                $0.value = 2015
            })
        
        
        //Url Row
        section.append(URLRow()
            {
                $0.title = "URLRow"
                $0.value = NSURL(string: "http://sagarshirbhate.blogspot.in")
            })
        
        
        
        /**
         *  Phone Row = Any Phone Number
         */
        section.append(PhoneRow()
            {
                $0.title = "PhoneRow (disabled)"
                $0.value = "+598 9898983510"
                $0.disabled = true // False
            })
        section.append(PhoneRow()
            {
                $0.title = "PhoneRow (Editable)"
            })
        
        
        
        /**
         *  First Alphabet will be capital itself
         */
        section.append(NameRow()
            {
                $0.title = "Name Row"
            })
        
        
        
        /**
         *  TextArea - a textview Form
         */
        section.append(TextAreaRow()
            {
                $0.placeholder = "TextAreaRow"
                $0.textAreaHeight = .Dynamic(initialTextViewHeight: 50)
            })
        
        
        /**
         *  Password Row - with Secure Entry
         */
         section.append(PasswordRow()
            {
                 $0.title = "Password Row"
                $0.placeholder = "PassWord"
                $0.tag="Password"
            })
        
        section.append(PasswordRow()
            {
                $0.placeholder = "PassWord"
            })
        
        
        
        /**
         *  Email Row - add Email Field
         */
        section.append(EmailRow()
            {
                $0.title = "EmailRow"
                $0.value = "sagarshirbhate@outlook.com"
            })
        
        section.append(EmailRow()
            {
                $0.placeholder = "EmailRow"
            })
        
        
        
        
        /**
         *  Twitter Row - Add Twitter Address
         */
        section.append(TwitterRow()
            {
                $0.title = "TwitterRow"
                $0.value = "@sagarshirbhate"
            })
        
        section.append(TwitterRow()
            {
                $0.placeholder = "TwitterRow"
            })
        
        
        
        
        /**
         *  Account Row - Any Account
         */
        section.append(AccountRow()
            {
                $0.title = "AccountRow"
                $0.value = "sagarshirbhate@outlook.com"
            })
        
        section.append(AccountRow()
            {
                $0.placeholder = "AccountRow"
            })
        
        
        /**
         *  Zip Code Row - Zip Code Value
         */
        section.append(ZipCodeRow()
            {
                $0.title = "ZipCodeRow"
                $0.value = "411052"
            })
        
        section.append(ZipCodeRow()
            {
                $0.placeholder = "ZipCodeRow"
            })
        
        
        
        /**
         *  Address Row - you can add postal Address
         */
        section.append(PostalAddressRow()
            {
                $0.title = "Address"
                $0.streetPlaceholder = "Street"
                $0.statePlaceholder = "State"
                $0.postalCodePlaceholder = "ZipCode"
                $0.cityPlaceholder = "City"
                $0.countryPlaceholder = "Country"
            })
        section.append(PostalAddressRow()
            {
                $0.title = "Address"
                $0.streetPlaceholder = "Street"
                $0.statePlaceholder = "State"
                $0.postalCodePlaceholder = "ZipCode"
                $0.cityPlaceholder = "City"
                $0.countryPlaceholder = "Country"
                $0.value = PostalAddress(
                    street: "Bavdhan-Pashan Road",
                    state: "Maharashtra",
                    postalCode: "411021",
                    city: "Pune",
                    country: "India"
                )
                $0.disabled = true
            })
        
        
        /**
         *  Date Row - Date Picker
         */
        section.append(DateRow()
            {
                $0.value = NSDate()
                $0.title="DateRow InPicker"
            })
        section.append(DateTimeInlineRow() {
            $0.title = "DateRow Expanding"
            $0.value = NSDate().dateByAddingTimeInterval(60*60*24)
        })
        
        
        /**
         *  Check Row - Check Boolean Yes/No
         */
        section.append(CheckRow()
            {
                $0.value = true
                $0.title="Boolean Row"
            })
        
        
        /**
         *  Switch Row - Yes NO Switch
         */
        section.append(SwitchRow()
            {
                $0.value = true
                $0.title="Switch Row"
            })
        
        
        /**
         *  Slider Row- Slide values
         */
        section.append(SliderRow()
            {
                $0.value = 2.0
                $0.title="Slider Row"
            })
        
        
        
        /**
         *  Slider Row- Slide values
         */
        section.append(StepperRow()
            {
                $0.value = 2
                $0.title="Stepper Row"
            })
        
        
        /**
         *  Image Row - Add Images
         */
        section.append(ImageRow()
            {
                 $0.title = "ImageRow"
            })
        
        
        
        
        
        /**
         *  Segmented Rows - UiSegment Rows with Types.
         */
        section.append(SegmentedRow<String>()
            {
                 $0.options = ["One", "Two", "Three"]
            });
        //With Image
        section.append(SegmentedRow<String>()
            {
                $0.options = ["One", "Two", "Three"]
                $0.cellSetup({ (cell, row) in
                    cell.imageView?.image = UIImage(named: "Selected")
                })
            });
        
        section.append(SegmentedRow<String>()
            {
                $0.title = "With No Image"
                $0.options = ["One", "Two", "Three", "Four" ]
                $0.value = "four"
            });
        //With Image
        section.append(SegmentedRow<String>()
            {
                $0.title = "With Image"
                $0.options = ["One", "Two", "Three", "Four" ]
                $0.value = "four"
                $0.cellSetup({ (cell, row) in
                    cell.imageView?.image = UIImage(named: "Selected")
                })
            });

        
        
        
        /**
         *  ActionSheet Row- Open Multiple Options in ActionSheet
         */
        section.append(ActionSheetRow<String>()
            {
                $0.title = "ActionSheetRow"
                $0.selectorTitle = "Your favourite ?"
                $0.options = ["Sagar", "Chandan", "Vishal", "Rushi"]
                $0.value = "Sagar"
            })
        
        
        
        /**
         *  AlertRow - Show Selection in AlertView
         */
        section.append(AlertRow<String>()
            {
                $0.title = "AlertRow"
                $0.selectorTitle = "Who is there?"
                $0.options = ["Sagar", "Chandan", "Vishal", "Rushi"]
                $0.value = "Sagar"
                $0.onChange({ row in
                    print(row.value)
                })
                $0.onPresent({ _ , to in
                    to.view.tintColor = .blackColor()
                })
            })
        
        
        /**
         *  Push Row - Open List in Next view to select and come Back
         */
        section.append(PushRow<String>()
            {
                $0.title = "PushRow"
                $0.selectorTitle = "Who is there?"
                $0.options = ["Sagar", "Chandan", "Vishal", "Rushi"]
                $0.value = "Sagar"
                $0.selectorTitle = "Choose Who was there!"
            })
        
        
        /**
         *  UIpopever Row - For iPAD popover required
         */
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            section.append(PopoverSelectorRow<String>()
                {
                    $0.title = "PopoverSelectorRow"
                    $0.options = ["Sagar", "Chandan", "Vishal", "Rushi"]
                    $0.value = "Sagar"
                    $0.selectorTitle = "Who is there?"
                })
        }
        
        
        
        /**
         *  Multiple Selection Row
         */
        section.append(MultipleSelectorRow<String>()
            {
                $0.title = "MultipleSelectorRow"
                $0.options = ["Sagar", "Chandan", "Vishal", "Rushi"]
                $0.value = ["Sagar"]
                $0.onPresent { from, to in
                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: from, action: #selector(self.multipleSelectorDone(_:)))};
            })
        
        
        
        
        /**
         *  Show Picker On Form it self No Title
         */
        section.append( LabelRow()
            {
                $0.title="Show Picker On Form it self No Title  \\/ " //set title
                $0.disabled=true
            })
        section.append(PickerRow<String>
            {
                (row : PickerRow<String>) -> Void in
                row.options =  ["Sagar", "Chandan", "Vishal", "Rushi"]
            })

        /**
         *  Button Row -  add Button to cell
         */
        section.append(ButtonRow()
            {
                $0.title = "Login"
                $0.onCellSelection({ (cell, row) in
                self.presentAlert("login Click")})
            } )
        
        form.append(section)
        
        let continents = ["Africa", "Antarctica", "Asia", "Australia", "Europe", "North America", "South America"]
        form +++ SelectableSection<ImageCheckRow<String>, String>() { section in
            section.header = HeaderFooterView(title: "Where do you live?")
        }
        
        for option in continents {
            form.last! <<< ImageCheckRow<String>(option){ lrow in
                lrow.title = option
                lrow.selectableValue = option
                lrow.value = nil
            }
        }
        
        let oceans = ["Arctic", "Atlantic", "Indian", "Pacific", "Southern"]
        form +++ SelectableSection<ImageCheckRow<String>, String>("And which of the following oceans have you taken a bath in?", selectionType: .MultipleSelection)
        for option in oceans {
            form.last! <<< ImageCheckRow<String>(option){ lrow in
                lrow.title = option
                lrow.selectableValue = option
                lrow.value = nil
                }.cellSetup { cell, _ in
                    cell.trueImage = UIImage(named: "Selected")!
                    cell.falseImage = UIImage(named: "UnSelected")!
            }
        }
        
        
    }
    
  
    //Assign Tag and get Values from the Form
    func presentAlert(message :NSString )  {
     print(message)
        let dict = form.values(includeHidden: true)
        let a = dict["Password"] as! String
        print(a)
    }

    
    func multipleSelectorDone(item:UIBarButtonItem) {
            navigationController?.popViewControllerAnimated(true)
    }
}


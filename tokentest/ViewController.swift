//
//  ViewController.swift
//  tokentest
//
//  Created by Christopher Dorick on 2/27/15.
//  Copyright (c) 2015 Christopher Dorick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    let pickerData = [" ", "Google", "Virginia Tech", "Apple"]
    @IBOutlet var myPicker: UIPickerView!
    @IBOutlet var myButton: UIButton!
    @IBOutlet var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        myButton.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK -Instance Methods
    func updatePage() {
        let selection = pickerData[myPicker.selectedRowInComponent(0)]
        if selection != " "{
            myButton.hidden = false
            myLabel.text = "Sign in to " + selection + " by pressing below"
        }
        else {
            myButton.hidden = true
            myLabel.text = "Select Service Above:"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updatePage()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let selection = pickerData[myPicker.selectedRowInComponent(0)]
        var secondScene = segue.destinationViewController as ViewController2
        if selection == "Google"{
            secondScene.tableData = ["Maps", "Gmail", "Hangouts", "Google +"]
        }
        else if selection == "Virginia Tech"{
            secondScene.tableData = ["Dining", "HSPA", "Scholar", "BT4U"]
        }
        else{
            secondScene.tableData = ["Maps", "Calendar", "iTunes", "Game Center"]
        }
        secondScene.tableImages = ["dining.jpg", "hspa.jpg", "scholar.jpg", "bt4u.jpg"]

        
    }
}


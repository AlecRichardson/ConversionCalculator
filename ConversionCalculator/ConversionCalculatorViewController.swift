//
//  ConversionCalculatorViewController.swift
//  ConversionCalculator
//
//  Created by Alec Richardson on 4/11/19.
//  Copyright © 2019 Alec Richardson. All rights reserved.
//

import UIKit

class ConversionCalculatorViewController: UIViewController {
    
    struct display {
        var label: String
        var inputUnit: String
        var outputUnit: String
        var type: String
    }
    
    var displays = [
        display(label: "fahrenheit to celsius", inputUnit: "°F", outputUnit: "°C", type: "FtoC"),
        display(label: "celsius to fahrenheit", inputUnit: "°C", outputUnit: "°F", type: "CtoF"),
        display(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km", type: "MtoK"),
        display(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi", type: "KtoM")
    ]
    
    var currentDisplay: display? = nil
    var input: String = ""
    var negativeNumber: Bool = false
    var decimal: Bool = false

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputDisplay.text = displays[0].inputUnit
        self.outputDisplay.text = displays[0].outputUnit
        self.currentDisplay = displays[0]
        // Do any additional setup after loading the view.
    }
    
    func convert() {
        let floatInput = Float(input)
        var conversion: Float? = nil
        var error: Bool = false
        
        switch currentDisplay?.type {
            case "FtoC": conversion = (floatInput! - 32) * (5/9)
            case "CtoF": conversion = (floatInput! * (9/5)) + 32
            case "MtoK": conversion = (floatInput! / 0.62137)
            case "KtoM": conversion = (floatInput! * 0.62137)
            default: error = true
        }
        
        if (error) {
            outputDisplay.text = "Error"
        }
        
        inputDisplay.text = input + (currentDisplay?.inputUnit)!
        outputDisplay.text = String(conversion!) + (currentDisplay?.outputUnit)!
    }
   
    @IBAction func numbers(_ sender: UIButton) {
        input += String(sender.tag)
        convert()
    }
    
    @IBAction func clear(_ sender: Any) {
        clearFunc()
    }
    
    func clearFunc() {
        self.inputDisplay.text = (currentDisplay?.inputUnit)!
        self.outputDisplay.text = (currentDisplay?.outputUnit)!
        input = ""
        negativeNumber = false
        decimal = false
    }
    
    @IBAction func posNegButton(_ sender: Any) {
        if (input != "") {
            if (negativeNumber) {
                negativeNumber = false
                input = input.filter { "0123456789.".contains($0) }
            } else {
                negativeNumber = true
                input = "-" + input
            }
        }

        convert()
    }
    
    @IBAction func decimalButton(_ sender: Any) {
        if (!decimal) {
            decimal = true
            input = input + "."
            convert()
        }
    }
    
    @IBAction func convert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose Converter", message: "Choose!", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celsius", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.clearFunc()
            self.inputDisplay.text = self.displays[0].inputUnit
            self.outputDisplay.text = self.displays[0].outputUnit
            self.currentDisplay = self.displays[0]
            
        }))
        alert.addAction(UIAlertAction(title: "celsius to fahrenheit", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.clearFunc()
            self.inputDisplay.text = self.displays[1].inputUnit
            self.outputDisplay.text = self.displays[1].outputUnit
            self.currentDisplay = self.displays[1]
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.clearFunc()
            self.inputDisplay.text = self.displays[2].inputUnit
            self.outputDisplay.text = self.displays[2].outputUnit
            self.currentDisplay = self.displays[2]
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.clearFunc()
            self.inputDisplay.text = self.displays[3].inputUnit
            self.outputDisplay.text = self.displays[3].outputUnit
            self.currentDisplay = self.displays[3]
        }))
        self.present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

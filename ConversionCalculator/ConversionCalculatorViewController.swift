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
    }
    
    var displays = [display(label: "fahrenheit to celsius", inputUnit: "°F", outputUnit: "°C"), display(label: "celsius to fahrenheit", inputUnit: "°C", outputUnit: "°F"), display(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"), display(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputDisplay.text = displays[0].inputUnit
        self.outputDisplay.text = displays[0].outputUnit
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func convert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose Converter", message: "Choose!", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celsius", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.displays[0].inputUnit
            self.outputDisplay.text = self.displays[0].outputUnit
            
        }))
        alert.addAction(UIAlertAction(title: "celsius to fahrenheit", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.displays[1].inputUnit
            self.outputDisplay.text = self.displays[1].outputUnit
            
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.displays[2].inputUnit
            self.outputDisplay.text = self.displays[2].outputUnit
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.displays[3].inputUnit
            self.outputDisplay.text = self.displays[3].outputUnit
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

//
//  ViewController.swift
//  DosageCalc
//
//  Created by Shane Forler on 10/24/17.
//  Copyright © 2017 Shane Forler. All rights reserved.
//
// Need to add cancel button or ability to click out of uipicker

import UIKit
import Foundation
import Darwin

class DosageCalcViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    func log(i: Double) -> Double {
        return Darwin.log(i) * M_LN10
    }
    
    func ln(i: Double) -> Double {
        return Darwin.log(i)
    }
    
    func sq(i: Double) -> Double {
        return i * i
    }
    
    func sqr(i: Double) -> Double {
        return i.squareRoot()
    }
    
    func power(x:Double, y:Double) -> Double{
        return pow(x, y)
    }
    
    func eTo(x:Double) -> Double{
        return exp(x)
    }
    @IBOutlet weak var view1: UIView!
    //Spinner selections
    @IBOutlet weak var DosageWeightTxt: UITextField!
    @IBOutlet weak var WeightTypeTxt: UITextField!
    @IBOutlet weak var LiqMedWeightTxt: UITextField!
    @IBOutlet weak var LiqVolTypeTxt: UITextField!
    @IBOutlet weak var DoseFreqTxt: UITextField!
    @IBOutlet weak var LiqDoseFreqTxt: UITextField!
    @IBOutlet weak var DecPercTxt: UITextField!
    
    // user entered
    @IBOutlet weak var EnteredDosageTxt: UITextField!
    @IBOutlet weak var EnteredWeightTxt: UITextField!
    @IBOutlet weak var EnteredLiqMedAmt: UITextField!
    @IBOutlet weak var EnteredLiqPerVol: UITextField!
    
    // label outputs
    @IBOutlet weak var DosageOutputLbl: UILabel!
    @IBOutlet weak var LiqDosageOutputLbl: UILabel!
    
    // actions
    
    var errormsg = ""
    var errormsg2: String? = ""
    var runningnum = ""
    var runningWeight = ""
    var runningMedAmt = ""
    var runningPerVol = ""
    
    var output1 = Double()
    var output2 = Double()
    
    var PatWeight = ""
    var PatDose = ""
    var PatMedAmt = ""
    var PatPerVol = ""

    
    @IBAction func DoseEntered(_ sender: Any) {
        PatDose = EnteredDosageTxt.text!
        // user entered value into Dosage
    }
    
    @IBAction func DoseWeightEntered(_ sender: Any) {
        PatWeight = EnteredWeightTxt.text!
        // user entered value into weight
    }
    
    
    @IBAction func LiqMedAmt(_ sender: Any) {
        PatMedAmt = EnteredLiqMedAmt.text!
        // user entered med Amount value
    }
    
    // Did EditingChange over  editingDidEnd
    
    @IBAction func LiqPerVol(_ sender: Any) {
        PatPerVol = EnteredLiqPerVol.text!
        // user entered per volume value
    }
    
    
    @IBAction func btnPressed(_ sender: Any) {
        
        // UI picker for which dosage format is picked
        switch DosageWeightTxt.text{
        case "mg/kg"?:
            if PatDose.isEmpty{
                errormsg = "error"
                print("error")
            } else {
                errormsg = ""
                runningnum = "\(Double(PatDose)! * 1)"
            }
        case "mcg/kg"?:
            if PatDose.isEmpty{
                errormsg = "error"
                print("error")
            } else {
                errormsg = ""
                runningnum = "\(Double(PatDose)! * 0.001)"
            }
        case "gm/kg"?:
            if PatDose.isEmpty{
                errormsg = "error"
                print("error")
            } else {
                errormsg = ""
                runningnum = "\(Double(PatDose)! * 1000)"
            }
        case .none:
            runningnum = ""
        default:
            runningnum = "\(Double(PatDose)! * 1)"
        }
        
        // UI picker for which weight format is picked
        switch WeightTypeTxt.text {
        case "kg"?:
            if PatWeight.isEmpty{
                errormsg = "error"
                print("error")
            } else {
                errormsg = ""
                runningWeight = "\(Double(PatWeight)! * 1)"
            }
        case "lbs"?:
            if PatWeight.isEmpty{
                errormsg = "error"
                print("error")
            } else {
                errormsg = ""
                runningWeight = "\(Double(PatWeight)! * 0.4539237)"
            }
        case .none:
            runningWeight = ""
            // or nil?
        default:
            runningWeight = "\(Double(PatWeight)! * 1)"
        }
        
        // UI picker value for which med amount format is picked
        switch LiqMedWeightTxt.text {
        case "mg"?:
           // if PatWeight.isEmpty && PatDose.isEmpty{
           //     print("optional")
           // }

            if PatMedAmt.isEmpty {
                errormsg2 = "error"
                print("error")
            }else {
                errormsg2 = ""
                runningMedAmt = "\(Double(PatMedAmt)! * 1)"
            }
        case "mcg"?:
            if PatMedAmt.isEmpty {
                errormsg2 = "error"
                print("error")
            }else {
                errormsg2 = ""
                runningMedAmt = "\(Double(PatMedAmt)! * 0.001)"
            }
        case "gm"?:
            if PatMedAmt.isEmpty {
                errormsg2 = "error"
                print("error")
            }else {
                errormsg2 = ""
                runningMedAmt = "\(Double(PatMedAmt)! * 1000)"
            }
        case .none:
            runningMedAmt = ""
        default:
            runningMedAmt = "\(Double(PatMedAmt)! * 1)"
        }
        
        // UI picker value for the type of per volume picked
        
        switch LiqVolTypeTxt.text {
        case "mL"?:
            if PatPerVol.isEmpty{
                errormsg2 = "error"
                print("error")
            } else {
                errormsg2 = ""
                runningPerVol = "\(Double(PatPerVol)! * 1)"
            }
        case "L"?:
            if PatPerVol.isEmpty{
                errormsg2 = "error"
                print("error")
            } else {
                errormsg2 = ""
                runningPerVol = "\(Double(PatPerVol)! * 1000)"
            }
        case .none:
            runningPerVol = ""
        default:
            runningPerVol = "\(Double(PatPerVol)! * 1)"
        }
        
        // UI picker value for dose frequency
        
        // UI picker value for liq dose frequency
        
        // UI picker value for  Decimal percision
        
        
        // make it take only labels
        // output labels
        // make errormsg empty after error is fixed ??
        // also clear lbl if required field is cleared EX: dose entered and weight, press button then removed weight should clear label
        if errormsg.isEmpty{
            output1 = Double(runningnum)! * Double(runningWeight)!
            DosageOutputLbl.text = String(output1)
        }
        
       // output2 = Double(runningMedAmt)! * Double(runningPerVol)!
    }
    let DosageWeight = ["mg/kg","mcg/kg","gm/kg"]
    
    let WeightType = ["kg","lbs"]
    
    let LiqMedWeight = ["gm","mcg","mg"]
    
    let LiqVolType = ["L","mL"]
    
    let DoseFreq = ["gm BID","gm Daily","gm QID","gm TID","gm q1 hr","gm q2 hr","gm q4 hr","mcg BID","mcg Daily","mcg QID","mcg TID","mcg q1 hr","mcg q2 hr","mcg q4 hr","mg BID","mg Daily","mg QID","mg TID","mg q1 hr","mg q2 hr","mg q4 hr"]
    
    let LiqDoseFreq = ["L BID","L Daily","L QID","L TID","L q1 hr","L q2 hr","L q4 hr","mL BID","mL Daily","mL QID","mL TID","mL q1 hr","mL q2 hr","mL q4 hr"]
    
    let DecPerc = ["0","1","2","3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EnteredDosageTxt.delegate = self
        EnteredWeightTxt.delegate = self
        EnteredLiqMedAmt.delegate = self
        EnteredLiqPerVol.delegate = self
        
        LiqDosageOutputLbl.text = ""
        DosageOutputLbl.text = ""
        DosageWeightTxt.text = DosageWeight[0]
        WeightTypeTxt.text = WeightType[0]
        LiqMedWeightTxt.text = LiqMedWeight[2]
        LiqVolTypeTxt.text = LiqVolType[1]
        DoseFreqTxt.text = DoseFreq[15]
        LiqDoseFreqTxt.text = LiqDoseFreq[8]
        DecPercTxt.text = DecPerc[2]
        
        let DosageWeightView = UIPickerView()
        DosageWeightView.delegate = self
        DosageWeightView.tag = 1
        DosageWeightTxt.inputView = DosageWeightView
        
        let WeightTypeView = UIPickerView()
        WeightTypeView.delegate = self
        WeightTypeView.tag = 2
        WeightTypeTxt.inputView = WeightTypeView
        
        let LiqMedWeightView = UIPickerView()
        LiqMedWeightView.delegate = self
        LiqMedWeightView.tag = 3
        LiqMedWeightTxt.inputView = LiqMedWeightView
        
        let LiqVolTypeView = UIPickerView()
        LiqVolTypeView.delegate = self
        LiqVolTypeView.tag = 4
        LiqVolTypeTxt.inputView = LiqVolTypeView
        
        let DoseFreqView = UIPickerView()
        DoseFreqView.delegate = self
        DoseFreqView.tag = 5
        DoseFreqTxt.inputView = DoseFreqView
        
        let LiqDoseFreqView = UIPickerView()
        LiqDoseFreqView.delegate = self
        LiqDoseFreqView.tag = 6
        LiqDoseFreqTxt.inputView = LiqDoseFreqView
        
        let DecPercView = UIPickerView()
        DecPercView.delegate = self
        DecPercView.tag = 7
        DecPercTxt.inputView = DecPercView
    
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView.tag == 1 {
            return DosageWeight.count
        }
        if pickerView.tag == 2 {
            return WeightType.count
        }
        if pickerView.tag == 3 {
            return LiqMedWeight.count
        }
        if pickerView.tag == 4 {
            return LiqVolType.count
        }
        if pickerView.tag == 5 {
            return DoseFreq.count
        }
        if pickerView.tag == 6 {
            return LiqDoseFreq.count
        }
        if pickerView.tag == 7 {
            return DecPerc.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return DosageWeight[row]
        }
        if pickerView.tag == 2 {
            return WeightType[row]
        }
        if pickerView.tag == 3 {
            return LiqMedWeight[row]
        }
        if pickerView.tag == 4 {
            return LiqVolType[row]
        }
        if pickerView.tag == 5 {
            return DoseFreq[row]
        }
        if pickerView.tag == 6 {
            return LiqDoseFreq[row]
        }
        if pickerView.tag == 7 {
            return DecPerc[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            DosageWeightTxt.text =  DosageWeight[row]
        }
        if pickerView.tag == 2 {
            WeightTypeTxt.text = WeightType[row]
        }
        if pickerView.tag == 3 {
            LiqMedWeightTxt.text = LiqMedWeight[row]
        }
        if pickerView.tag == 4 {
            LiqVolTypeTxt.text = LiqVolType[row]
        }
        if pickerView.tag == 5 {
            DoseFreqTxt.text = DoseFreq[row]
        }
        if pickerView.tag == 6 {
            LiqDoseFreqTxt.text = LiqDoseFreq[row]
        }
        if pickerView.tag == 7 {
            DecPercTxt.text = DecPerc[row]
        }
        
        self.view.endEditing(false)
    }
    
}



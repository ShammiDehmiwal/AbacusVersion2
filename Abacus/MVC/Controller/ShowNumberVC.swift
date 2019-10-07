//
//  ShowNumberVC.swift
//  Abacus
//
//  Created by Reena on 26/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import UIKit

class ShowNumberVC: UIViewController,UITextFieldDelegate
{
    
    //show question with loading progress view.
    @IBOutlet weak var pvShowLoading: UIProgressView!
    
    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var ivCircleBg: UIImageView!
    
    
    
    // input answer view.
    @IBOutlet weak var vUserAnswer: UIView!
    @IBOutlet weak var txtUserAnswer: UITextField!
    
    
    
    var iNumberOfDigits : Int = 0
    var iCounter : Int = 1
    var timer = Timer()
    var iShowInterval : Int = 0
    var iPreviousNumber : Int = 0
    var strDigitType : String = "single"
    var bShowSubtraction : Bool = false
    
    
    var strExpression : String = ""
    var iActualTotal : Int = 0
    
    //MARK: - View Life Cycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        pvShowLoading.transform = CGAffineTransform(scaleX: 1, y: 4)
        
        pvShowLoading.layer.cornerRadius = 8
        pvShowLoading.clipsToBounds = true
        pvShowLoading.layer.sublayers![1].cornerRadius = 8
        pvShowLoading.subviews[1].clipsToBounds = true
        
        // initialise the display
        pvShowLoading.progress = 0.0
        
        // start the timer
        timer = Timer.scheduledTimer(timeInterval: Double(Double(iShowInterval*2)/1000), target: self, selector: #selector(ShowNumberVC.setProgressBar), userInfo: nil, repeats: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //iCounter = 1
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer.invalidate()
        
    }
    
    @objc func setProgressBar()
    {
        lblNumber.isHidden = false
        
        print("iCounter Value : \(iCounter)")
        print("Progress Loading : \(Float(iCounter) / Float(iNumberOfDigits))")
        pvShowLoading.progress = Float(iCounter) / Float(iNumberOfDigits)  //Float(iCounter/iNumberOfDigits)
        
        var aRandomInt : Int = 0
        
        repeat {
            //take input from standard IO into variable n
            
            aRandomInt = self.generateRandomNumber(isShowSubtraction: bShowSubtraction, strDigitTypeLocal: self.strDigitType)
            
            if iCounter == 1 //first number should not be - (minus) and greater than 0.
            {
                if aRandomInt <= 5
                {
                    aRandomInt = 0
                }
                
            }else if iCounter == 2 //second number should be less than previous number.
            {
                let positiveNumber : Int = abs(aRandomInt)
                
                if positiveNumber >= iPreviousNumber
                {
                    aRandomInt = 0 // repeat process again for new number.
                }
                
                print("---------  second number : \(aRandomInt)")
                
                
                
                //                if iActualTotal < positiveNumber
                //                {
                //                    aRandomInt = positiveNumber
                //
                //                }else
                //                {//if sum greater then go further.
                //
                //                }
                
            }else // rest next upcoming random number not less total of all previous numbers.
            {
                // print("--------------- New Random Number ------- : \(aRandomInt)")
                
                //check last number.
                if iNumberOfDigits == iCounter
                {
                    switch self.strDigitType
                    {
                    case "single" :
                        aRandomInt = Int.random(in: 1...9)
                        break
                        
                    case "double" :
                        aRandomInt = Int.random(in: 10...99)
                        break
                        
                    case "triple" :
                        aRandomInt = Int.random(in: 100...999)
                        break
                        
                    default :
                        break
                    }
                    
                }else
                {
                    let positiveNumber : Int = abs(aRandomInt)
                    
                    
                    if positiveNumber < iActualTotal && positiveNumber != 0
                    {
                        break
                        
                    }else
                    {
                        switch self.strDigitType
                        {
                        case "single" :
                            
                            if iActualTotal < 9 && iActualTotal > 0
                            {
                                aRandomInt = Int.random(in: 1...iActualTotal)
                            }else
                            {
                             aRandomInt = Int.random(in: 1...9)
                            }
                          
                            break
                            
                        case "double" :
                            if iActualTotal < 99 && iActualTotal > 10
                            {
                                aRandomInt = Int.random(in: 10...iActualTotal)
                                
                            }else
                            {
                                 aRandomInt = Int.random(in: 10...99)
                            }
                            break
                            
                        case "triple" :
                            print("------- third digit sum : \(iActualTotal)")
                            if iActualTotal < 999 && iActualTotal > 100
                            {
                                aRandomInt = Int.random(in: 100...iActualTotal)
                                
                            }else
                            {
                                 aRandomInt = Int.random(in: 100...999)
                            }
                            break
                            
                        default :
                            break
                        }
                        
                        break
                    }
                    
                    
                    //                    if iActualTotal < positiveNumber && iActualTotal != 0
                    //                    {
                    //                        switch self.strDigitType
                    //                        {
                    //                        case "single" :
                    //                            aRandomInt = Int.random(in: 1...iActualTotal)
                    //                            break
                    //
                    //                        case "double" :
                    //                            aRandomInt = Int.random(in: 10...iActualTotal)
                    //                            break
                    //
                    //                        case "third" :
                    //                            aRandomInt = Int.random(in: 100...iActualTotal)
                    //                            break
                    //
                    //                        default :
                    //                            break
                    //                        }
                    //
                    //                    }else
                    //                    {//
                    //                        if iActualTotal < 0
                    //                        {
                    //                             let positiveNumber : Int = abs(aRandomInt)
                    //
                    //                             aRandomInt = positiveNumber
                    //
                    //                        }else
                    //                        {
                    //                             //aRandomInt = 0
                    //                        }
                    //
                    //                    }
                    
                    
                    
                    
                    
                    
                    //                    let positiveNumber : Int = abs(aRandomInt)
                    //
                    //                    if iActualTotal < positiveNumber
                    //                    {
                    //                        aRandomInt = positiveNumber
                    //
                    //                    }else
                    //                    {//if sum greater then go further.
                    //                        //aRandomInt = 0
                    //                    }
                    
                    
                    //
                    //                    if iActualTotal >= -3
                    //                    {
                    //                        if iActualTotal < aRandomInt //when total is less than new random number.
                    //                        {
                    //                            aRandomInt = 0
                    //
                    //                            //                    switch self.strDigitType
                    //                            //                    {
                    //                            //                    case "single" :
                    //                            //
                    //                            //                        if self.bShowSubtraction
                    //                            //                        {
                    //                            //                            aRandomInt = Int.random(in: -9...iActualTotal)
                    //                            //
                    //                            //                        }else
                    //                            //                        {
                    //                            //                            aRandomInt = Int.random(in: 1...iActualTotal)
                    //                            //                        }
                    //                            //
                    //                            //                        break
                    //                            //
                    //                            //                    case "double" :
                    //                            //
                    //                            //                        if self.bShowSubtraction
                    //                            //                        {
                    //                            //                            aRandomInt = Int.random(in: -9...iActualTotal)
                    //                            //
                    //                            //                        }else
                    //                            //                        {
                    //                            //                            aRandomInt = Int.random(in: 1...iActualTotal)
                    //                            //                        }
                    //                            //
                    //                            //                        break
                    //                            //
                    //                            //                    case "third" :
                    //                            //                        break
                    //                            //
                    //                            //                    default :
                    //                            //                        break
                    //                            //
                    //                            //                    }
                    //
                    //
                    //                        }
                    //                    }else
                    //                    { //generate positive number only
                    //                        switch self.strDigitType
                    //                        {
                    //                        case "single" :
                    //
                    //                            aRandomInt = Int.random(in: 1...9)
                    //
                    //                            break
                    //
                    //                        case "double" :
                    //
                    //                            aRandomInt = Int.random(in: 10...99)
                    //
                    //                            break
                    //
                    //                        case "third" :
                    //
                    //                             aRandomInt = Int.random(in: 100...999)
                    //
                    //                            break
                    //
                    //                        default :
                    //                            break
                    //
                    //                        }
                    //                    }
                }
                
            }
            
        } while aRandomInt == 0;
        
        
        
        if aRandomInt == iPreviousNumber
        {
            repeat {
                //take input from standard IO into variable n
                
                aRandomInt = self.generateRandomNumber(isShowSubtraction: bShowSubtraction, strDigitTypeLocal: self.strDigitType)
                
            } while aRandomInt == 0;
            
        }else
        {
            iPreviousNumber = aRandomInt
        }
        
        
        
        print("---------------- Random Number : \(aRandomInt)")
        iPreviousNumber = aRandomInt
        
        
        if iNumberOfDigits == iCounter
        {
            pvShowLoading.progress = 1.0
            
            timer.invalidate()
            iCounter = 0
            
            //set all expression and calculate results.
            lblNumber.text = "\(aRandomInt)"
            
            iActualTotal = iActualTotal + aRandomInt
            
            if aRandomInt >= 0
            {//positive number
                strExpression = "\(strExpression)+\(aRandomInt)"
            }else
            {//negative number
                strExpression = "\(strExpression)\(aRandomInt)"
            }
            
            
            
//            UIView.animate(withDuration: 2.3, delay: 4.0, options: [], animations: {
//                //Animations
//            }) { (finished) in
//
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(Double(iShowInterval*2)/1000), execute: {
                //show user answer view.
                self.vUserAnswer.isHidden = false
                
                let transition = CATransition()
                transition.duration = 0.5
                
                transition.type = CATransitionType.push
                transition.subtype = CATransitionSubtype.fromRight
                transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
                self.vUserAnswer.layer.add(transition, forKey: kCATransition)
                
                self.txtUserAnswer.becomeFirstResponder()
            })
            
            
         //   }
            
         
        }else
        {
            
            lblNumber.text = "\(aRandomInt)"
            
            iActualTotal = iActualTotal + aRandomInt
            
            if iCounter == 1
            {
                strExpression = "\(aRandomInt)"
                
            }else
            {
                if aRandomInt >= 0
                {//positive number
                    strExpression = "\(strExpression)+\(aRandomInt)"
                }else
                {//negative number
                    strExpression = "\(strExpression)\(aRandomInt)"
                }
            }
            
            iCounter = iCounter + 1
        }
        
        print("Actual Total : \(iActualTotal)")
        
       
              Timer.scheduledTimer(timeInterval: Double(Double(iShowInterval)/1000), target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        
    }
    
    @objc func hideLabel()
    {
        self.lblNumber.isHidden = true
        
//        if iNumberOfDigits == iCounter
//        {
//            sleep(1)
//        }
    }
    
    
    
    func generateRandomNumber(isShowSubtraction : Bool, strDigitTypeLocal : String) -> Int
    {
        var aRandomInt : Int = 0
        
        if isShowSubtraction
        {
            if strDigitTypeLocal == "single"
            {
                aRandomInt = Int.random(in: -9...9)
                
            }else if strDigitTypeLocal == "double"
            {
                aRandomInt = Int.random(in: -99...(99))
                
                if aRandomInt.digitCount == 1
                {
                    aRandomInt = Int.random(in: -99...(10))
                }
                
            }else if strDigitTypeLocal == "triple"
            {
                aRandomInt = Int.random(in: -999...(999))
                
                if aRandomInt.digitCount == 1 || aRandomInt.digitCount == 2
                {
                    aRandomInt = Int.random(in: -999...(100))
                }
            }
            
        }else
        {
            if strDigitTypeLocal == "single"
            {
                aRandomInt = Int.random(in: 1...9)
                
            }else if strDigitTypeLocal == "double"
            {
                aRandomInt = Int.random(in: 10...99)
                
            }else if strDigitTypeLocal == "triple"
            {
                aRandomInt = Int.random(in: 100...999)
                
            }
        }
        
        return aRandomInt
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtUserAnswer {
            let allowedCharacters = "+-1234567890"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            
            if string == "-"
            {
                if textField.text?.count == 0
                {
                    return true
                    
                }else
                {
                    return false
                }
            }
            
            if string == ""
            {
                return true
            }
            
            return alphabet
            
        }
        
        return true
    }
    
    
    //MARK: - UIButton Action Methods.
    @IBAction func btnSubmitAnswerTapAction(_ sender: UIButton)
    {
        if txtUserAnswer.text == ""
        {
            let alertController = UIAlertController(title: "Warning", message: "Please input your answer.", preferredStyle:UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            { action -> Void in
                // Put your code here
            })
            self.present(alertController, animated: true, completion: nil)
            
        }else
        {
            
            var strShowSubtraction : String = "No"
            if bShowSubtraction
            {
                strShowSubtraction = "Yes"
                
            }else
            {
                strShowSubtraction = "No"
            }
            
            var isResultPass : Bool = false
            
            if txtUserAnswer.text! == "\(iActualTotal)"
            {
                isResultPass = true
            }
            
            let dicQuestion : NSDictionary = ["questionNumber":"\(appDel.marrUserQuestions.count+1)","expression":strExpression,"actualTotal":"\(iActualTotal)","yourAnswer":"\(txtUserAnswer.text!)","numberOfDigit":"\(iNumberOfDigits)","speedTimeMS":"\(iShowInterval)","isShowSubtraction":strShowSubtraction,"digitType":strDigitType,"isResultPass":isResultPass]
            
            appDel.marrUserQuestions.add(dicQuestion)
            
            
            let obj :  QuestionAnswerVC = self.storyboard?.instantiateViewController(withIdentifier: "QuestionAnswerVC") as! QuestionAnswerVC
            
            obj.dicQuestionResult = dicQuestion
            
            self.navigationController?.pushViewController(obj, animated: true)
        }
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

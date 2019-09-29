//
//  ShowNumberVC.swift
//  Abacus
//
//  Created by Reena on 26/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import UIKit

class ShowNumberVC: UIViewController {

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
        timer = Timer.scheduledTimer(timeInterval: Double(Double(iShowInterval)/1000), target: self, selector: #selector(ShowNumberVC.setProgressBar), userInfo: nil, repeats: true)
    
    }
    
    
    @objc func setProgressBar()
    {
        print("iCounter Value : \(iCounter)")
        print("Progress Loading : \(Float(iCounter) / Float(iNumberOfDigits))")
        pvShowLoading.progress = Float(iCounter) / Float(iNumberOfDigits)  //Float(iCounter/iNumberOfDigits)
        
        var aRandomInt : Int = 0
        
        repeat {
            //take input from standard IO into variable n
            
            aRandomInt = self.generateRandomNumber(isShowSubtraction: bShowSubtraction, strDigitTypeLocal: self.strDigitType)
            
            
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
        
        
        
        print("Random Number : \(aRandomInt)")
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
            
            
            
            //show user answer view.
            vUserAnswer.isHidden = false
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            vUserAnswer.layer.add(transition, forKey: kCATransition)
            
            
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
                
            }else if strDigitTypeLocal == "triple"
            {
                aRandomInt = Int.random(in: -999...(999))
            }
            
        }else
        {
            if strDigitTypeLocal == "single"
            {
                aRandomInt = Int.random(in: 0...9)
                
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
    
    
    //MARK: - UIButton Action Methods.
    @IBAction func btnSubmitAnswerTapAction(_ sender: UIButton)
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

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

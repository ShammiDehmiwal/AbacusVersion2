//
//  QuestionAnswerVC.swift
//  Abacus
//
//  Created by Reena on 27/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import UIKit

class QuestionAnswerVC: UIViewController {

    @IBOutlet weak var ivTopBar: UIImageView!
    
    
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBOutlet weak var ivCircleTopBar: UIImageView!
    
    @IBOutlet weak var btnQuestionNumber: UIButton!
    
    @IBOutlet weak var vDetailResult: UIView!
    
    @IBOutlet weak var lblQuestionExpression: UILabel!
    
    @IBOutlet weak var lblActualResult: UILabel!
    
    @IBOutlet weak var lblYourAnswer: UILabel!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var lblTotalQuestions: UILabel!
    
    
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 50.0
    
    var dicQuestionResult : NSDictionary = NSDictionary()
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initView()
    }
    
    
    //MARK: - Custom Methods.
    func initView()
    {
        if shadowLayer == nil
        {
            shadowLayer = CAShapeLayer()
            
            shadowLayer.path = UIBezierPath(roundedRect: vDetailResult.bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.black.cgColor
            
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 5
            
            vDetailResult.layer.insertSublayer(shadowLayer, at: 0)
            vDetailResult.layer.cornerRadius = cornerRadius
        }
        
        
        
        if self.dicQuestionResult.allKeys.count > 0
        {
            
            
            if self.dicQuestionResult.object(forKey: "actualTotal") as! String == self.dicQuestionResult.object(forKey: "yourAnswer") as! String
            {//right answer
              ivTopBar.image = UIImage(named: "topBarGreenBgImage")!
                ivCircleTopBar.image = UIImage(named: "resultCorrectImage")!
                
             
                
            }else
            {//wrong answwer
                ivTopBar.image = UIImage(named: "topBarRedBgImage")!
                ivCircleTopBar.image = UIImage(named: "resultIncorrectImage")!
                
              
            }
            
            if let strQuestionName = self.dicQuestionResult.object(forKey: "questionNumber") as? String
            {
                btnQuestionNumber.setTitle("Question \(strQuestionName)", for: .normal)
            }
            
            if let strExpression = self.dicQuestionResult.object(forKey: "expression") as? String
            {
                lblQuestionExpression.text = strExpression
            }
            
            if let strActualTotal = self.dicQuestionResult.object(forKey: "actualTotal") as? String
            {
                lblActualResult.text = strActualTotal
            }
            
            if let strYourAnswer = self.dicQuestionResult.object(forKey: "yourAnswer") as? String
            {
                lblYourAnswer.text = strYourAnswer
            }
            
            var iRightAnswer : Int = 0
            
            for x in 0..<appDel.marrUserQuestions.count
            {
                let dicResult : NSDictionary = appDel.marrUserQuestions.object(at: x) as! NSDictionary
                
                if dicResult.value(forKey: "isResultPass") as! Bool
                {
                    iRightAnswer = iRightAnswer + 1
                }
            }
            
            lblResult.text = "\(iRightAnswer)/10"
            
            
        }
        
    }
    

    //MARK: - UIButton Action Methods.
    @IBAction func btnNextQuestionsTapAction(_ sender: UIButton)
    {
        //navigate to other screen
        let obj : ShowNumberVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowNumberVC") as! ShowNumberVC
        
        obj.iNumberOfDigits = appDel.selectNumberOfDigit
        obj.iShowInterval = appDel.selectShowSpeed
        obj.strDigitType = appDel.selectDigitType
        obj.bShowSubtraction = appDel.selectIsSubtractionEnable
        
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    
    @IBAction func btnSeeResultsTapAction(_ sender: UIButton)
    {
        let obj : ShowResultsVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowResultsVC") as! ShowResultsVC
        
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

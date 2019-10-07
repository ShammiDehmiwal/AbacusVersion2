//
//  ShowResultsVC.swift
//  Abacus
//
//  Created by Reena on 27/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import UIKit

class ShowResultsVC: UIViewController {

    @IBOutlet weak var ivCircle: UIImageView!
    
    @IBOutlet weak var lblPercentage: UILabel!
    
    @IBOutlet weak var btnDigitType: UIButton!
    
    @IBOutlet weak var vResultDetailView: UIView!
    @IBOutlet weak var vBgResultDetailView: UIView!
    
    @IBOutlet weak var btnBack: UIButton!
    
    
    @IBOutlet weak var lblTotalQuestions: UILabel!
    
    @IBOutlet weak var lblCorrectAnswer: UILabel!
    
    @IBOutlet weak var lblPercentageDetail: UILabel!
    
    @IBOutlet weak var lblWrongAnswer: UILabel!
    
    
    // container view and image view have the same corner radius
    let cornerRadius : CGFloat = 20.0
    
    //MARK: - View Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vBgResultDetailView.layer.cornerRadius = cornerRadius
        vBgResultDetailView.layer.shadowColor = UIColor.darkGray.cgColor
        vBgResultDetailView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        vBgResultDetailView.layer.shadowRadius = 20.0
        vBgResultDetailView.layer.shadowOpacity = 0.9
        
        vResultDetailView.layer.cornerRadius = cornerRadius
        vResultDetailView.clipsToBounds = true
        
        if appDel.marrUserQuestions.count <= 10
        {
            btnBack.isHidden = false
            
        }else
        {
            btnBack.isHidden = true
        }
        
        
        lblTotalQuestions.text = "\(appDel.marrUserQuestions.count)"
        
        
        var iCorrectAnswer : Int = 0
        
        for x in 0..<appDel.marrUserQuestions.count
        {
            let dicResult : NSDictionary = appDel.marrUserQuestions.object(at: x) as! NSDictionary
            
            if dicResult.value(forKey: "isResultPass") as! Bool
            {
                iCorrectAnswer = iCorrectAnswer + 1
            }
            
            if x == 0
            {
                if let strDigi = dicResult.object(forKey: "digitType") as? String
                {
                    if strDigi == "single"
                    {
                        btnDigitType.setTitle("Single Digit", for: .normal)
                        
                    }else if strDigi == "double"
                    {
                         btnDigitType.setTitle("Double Digit", for: .normal)
                        
                    }else if strDigi == "triple"
                    {
                         btnDigitType.setTitle("Triple Digit", for: .normal)
                    }
                    
                    btnDigitType.isUserInteractionEnabled = false
                }
            }
            
        }
        
        lblCorrectAnswer.text = "\(iCorrectAnswer)"
        
        let iWrongAsnwer : Int = appDel.marrUserQuestions.count - iCorrectAnswer
        
        lblWrongAnswer.text = "\(iWrongAsnwer)"
    
        
        let fResultPercentage : Float = Float(iCorrectAnswer) / Float(appDel.marrUserQuestions.count)
        
        let iResult : Int = Int(fResultPercentage * 100)
        
        lblPercentage.text = "\(iResult)%"
        lblPercentageDetail.text = lblPercentage.text
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        ivCircle.layer.cornerRadius = ivCircle.frame.size.height/2
        ivCircle.layer.masksToBounds = true
    }
    
    @IBAction func btnBackTapAction(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnStartAgainTapAction(_ sender: UIButton)
    {
        appDel.marrUserQuestions.removeAllObjects()
        
        appDel.selectNumberOfDigit = 15
        appDel.selectShowSpeed = 500
        appDel.selectDigitType = "single"
        appDel.selectIsSubtractionEnable = true
        
        let obj : ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
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

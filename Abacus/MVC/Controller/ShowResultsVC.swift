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
    
    @IBOutlet weak var lblTotalQuestions: UILabel!
    
    @IBOutlet weak var lblCorrectAnswer: UILabel!
    
    @IBOutlet weak var lblPercentageDetail: UILabel!
    
    @IBOutlet weak var lblWrongAnswer: UILabel!
    
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 50.0
    
    
    //MARK: - View Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if shadowLayer == nil
        {
            shadowLayer = CAShapeLayer()
            
            shadowLayer.path = UIBezierPath(roundedRect: vResultDetailView.bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.black.cgColor
            
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 5
            
            vResultDetailView.layer.insertSublayer(shadowLayer, at: 0)
            
        }
        
        
        
        ivCircle.layer.cornerRadius = ivCircle.frame.size.height/2
        ivCircle.layer.masksToBounds = true
        
        
        lblTotalQuestions.text = "\(appDel.marrUserQuestions.count)"
        
        var iCorrectAnswer : Int = 0
        
        for x in 0..<appDel.marrUserQuestions.count
        {
            let dicResult : NSDictionary = appDel.marrUserQuestions.object(at: x) as! NSDictionary
            
            if dicResult.value(forKey: "isResultPass") as! Bool
            {
                iCorrectAnswer = iCorrectAnswer + 1
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

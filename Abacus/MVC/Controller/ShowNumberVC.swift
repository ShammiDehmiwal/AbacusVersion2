//
//  ShowNumberVC.swift
//  Abacus
//
//  Created by Reena on 26/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import UIKit

class ShowNumberVC: UIViewController {

    
    @IBOutlet weak var pvShowLoading: UIProgressView!
    
    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var ivCircleBg: UIImageView!
    
    
    var iNumberOfDigits : Int = 0
    var iCounter : Int = 0
    var timer = Timer()
    var iShowInterval : Int = 0
    var strDigitType : String = "single"
    var bShowSubtraction : Bool = false
    
    
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
        if iNumberOfDigits == iCounter
        {
            pvShowLoading.progress = 1.0
            
            timer.invalidate()
            iCounter = 0
            
        }else
        {
            iCounter = iCounter + 1
            
            pvShowLoading.progress = Float(iCounter/iNumberOfDigits)
            
            var aRandomInt : Int = 0
            
            if bShowSubtraction
            {
                if strDigitType == "single"
                {
                    aRandomInt = Int.random(in: -9...9)
                    
                }else if strDigitType == "double"
                {
                    aRandomInt = Int.random(in: -99...(99))
                    
                }else if strDigitType == "triple"
                {
                    aRandomInt = Int.random(in: -999...(999))
                }
                
            }else
            {
                if strDigitType == "single"
                {
                    aRandomInt = Int.random(in: 0...9)
                    
                }else if strDigitType == "double"
                {
                    aRandomInt = Int.random(in: 10...99)
                    
                }else if strDigitType == "triple"
                {
                    aRandomInt = Int.random(in: 100...999)
                }
            }
            
           lblNumber.text = "\(aRandomInt)"
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

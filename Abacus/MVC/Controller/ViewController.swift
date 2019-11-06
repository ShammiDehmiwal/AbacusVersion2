//
//  ViewController.swift
//  Abacus
//
//  Created by Reena on 26/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var btnFeedbackIcon: UIButton!
    
    @IBOutlet weak var vLevelDetailView: UIView!
    
    @IBOutlet weak var vBgDetailView: UIView!
    
    //levels
    @IBOutlet weak var vLevel1: UIView!
    
    @IBOutlet weak var vLevel2: UIView!
    
    @IBOutlet weak var vLevel3: UIView!
    
    @IBOutlet weak var vLevel4: UIView!
    
    @IBOutlet weak var ivLevel1: UIImageView!
    @IBOutlet weak var ivLevel2: UIImageView!
    @IBOutlet weak var ivLevel3: UIImageView!
    @IBOutlet weak var ivLevel4: UIImageView!
    
    @IBOutlet weak var lblLevel2Text: UILabel!
    @IBOutlet weak var lblLevel1Text: UILabel!
    @IBOutlet weak var lblLevel3Text: UILabel!
    @IBOutlet weak var lblLevel4Text: UILabel!
    
    
    
    
    @IBOutlet weak var btnLevelDetailTitle: UIButton!
    
    
    
    //v Detail Level View
    @IBOutlet weak var lblDigitType: UILabel!
    
    @IBOutlet weak var lblNumberOfDigit: UILabel!
    
    @IBOutlet weak var lblSubtraction: UILabel!
    
    @IBOutlet weak var lblFlickeringSpeed: UILabel!
    
    @IBOutlet weak var btnSpeedUpFlickering: UIButton!
    
    @IBOutlet weak var btnSpeedDownFlickering: UIButton!
    
   // var dicLevels : NSMutableDictionary = NSMutableDictionary()
  
    
    
    
    var dicLevelSingle : NSDictionary = ["name":"Single Digit","digitType":"Single Digit","numberOfDigit":"15","speed":"500","isSubtraction":"Yes"]
    
    var dicLevelDouble : NSDictionary = ["name":"Double Digit","digitType":"Double Digit","numberOfDigit":"10","speed":"500","isSubtraction":"Yes"]
    
    var dicLevelThird : NSDictionary = ["name":"Triple Digit","digitType":"Triple Digit","numberOfDigit":"5","speed":"500","isSubtraction":"Yes"]
    
     var dicLevelCustom : NSDictionary = ["name":"Custom","digitType":"Single","numberOfDigit":"15","speed":"500","isSubtraction":"Yes"]
    
    
    var strCurrentDigitType : String = "single"
    var iNumberOfDigit : Int = 15
    var iSpeed : Int = 500
    var bIsSubtraction : Bool = true
    
    
    
    
    // container view and image view have the same corner radius
    let cornerRadius : CGFloat = 20.0
    
    //MARK: - View Life Cycle Methods.
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        vBgDetailView.layer.cornerRadius = cornerRadius
        vBgDetailView.layer.shadowColor = UIColor.darkGray.cgColor
        vBgDetailView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        vBgDetailView.layer.shadowRadius = 20.0
        vBgDetailView.layer.shadowOpacity = 0.9
        
        vLevelDetailView.layer.cornerRadius = cornerRadius
        vLevelDetailView.clipsToBounds = true
        
        self.initLevels()
    }
    
//    override func viewDidLayoutSubviews()
//    {
//        super.viewDidLayoutSubviews()
//
//        if shadowLayer == nil
//        {
//            shadowLayer = CAShapeLayer()
//
//            shadowLayer.path = UIBezierPath(roundedRect: vLevelDetailView.bounds, cornerRadius: cornerRadius).cgPath
//            shadowLayer.fillColor = UIColor.black.cgColor
//
//            shadowLayer.shadowColor = UIColor.black.cgColor
//            shadowLayer.shadowPath = shadowLayer.path
//            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//            shadowLayer.shadowOpacity = 0.8
//            shadowLayer.shadowRadius = 5
//
//            vLevelDetailView.layer.insertSublayer(shadowLayer, at: 0)
//
//            // pin the containerView to the edges to the view
////            self.vLevelDetailView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
////            self.vLevelDetailView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
////            self.vLevelDetailView.topAnchor.constraint(equalTo: topAnchor).isActive = true
////            self.vLevelDetailView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
////
//        }
//    }
//
    
    //MARK: - initView Methods.
    func initLevels()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ivLevel1TapAction))
        vLevel1.isUserInteractionEnabled = true
        vLevel1.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(ivLevel2TapAction))
        vLevel2.isUserInteractionEnabled = true
        vLevel2.addGestureRecognizer(tapGestureRecognizer1)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(ivLevel3TapAction))
        vLevel3.isUserInteractionEnabled = true
        vLevel3.addGestureRecognizer(tapGestureRecognizer2)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(ivLevel4TapAction))
        vLevel4.isUserInteractionEnabled = true
        vLevel4.addGestureRecognizer(tapGestureRecognizer3)
        
        
        
        let tapGestureRecognizerType = UITapGestureRecognizer(target: self, action: #selector(lblDigitTypeTapAction))
        lblDigitType.isUserInteractionEnabled = true
        lblDigitType.addGestureRecognizer(tapGestureRecognizerType)
        
        let tapGestureRecognizerNumber = UITapGestureRecognizer(target: self, action: #selector(lblNumberDigitTapAction))
        lblNumberOfDigit.isUserInteractionEnabled = true
        lblNumberOfDigit.addGestureRecognizer(tapGestureRecognizerNumber)
        
//        let tapGestureRecognizerSpeed = UITapGestureRecognizer(target: self, action: #selector(lblFlickeringkSpeedTapAction))
//        lblFlickeringSpeed.isUserInteractionEnabled = true
//        lblFlickeringSpeed.addGestureRecognizer(tapGestureRecognizerSpeed)
        
        let tapGestureRecognizerSubstraction = UITapGestureRecognizer(target: self, action: #selector(lblSubstractionTapAction))
        lblSubtraction.isUserInteractionEnabled = true
        lblSubtraction.addGestureRecognizer(tapGestureRecognizerSubstraction)
        
        self.lblDigitType.isEnabled = false
        self.lblNumberOfDigit.isEnabled = false
        self.lblFlickeringSpeed.isEnabled = false
        self.lblSubtraction.isEnabled = false
    }
    

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//
//    }

    
    
    
    @IBAction func btnFeedbackTapAction(_ sender: UIButton)
    {
        let obj : FeedbackVC = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackVC") as! FeedbackVC
        
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    @IBAction func btnSpeedUpTapAction(_ sender: UIButton)
    {
        
        iSpeed = iSpeed + 50
        
        lblFlickeringSpeed.text = "\(iSpeed)ms"
    }
    
    @IBAction func btnSpeedDownTapAction(_ sender: UIButton)
    {
        if iSpeed >= 50
        {
            iSpeed = iSpeed - 50
        }
        
          lblFlickeringSpeed.text = "\(iSpeed)ms"
    }
    
    
    
    //MARK: - Custom Methods.
    @objc func ivLevel1TapAction(gesture : UIGestureRecognizer)
    {
        lblDigitType.text = dicLevelSingle.object(forKey: "digitType") as? String
        
        lblNumberOfDigit.text = dicLevelSingle.object(forKey: "numberOfDigit") as? String
        
        lblFlickeringSpeed.text = "\(dicLevelSingle.object(forKey: "speed") as! String)ms"
        
        lblSubtraction.text = dicLevelSingle.object(forKey: "isSubtraction") as? String
        
        strCurrentDigitType = "single"
        
         btnLevelDetailTitle.setTitle("Single Digit", for: .normal)
        
        let num = dicLevelSingle.object(forKey: "numberOfDigit") as! String
       iNumberOfDigit = num.toInt()
        
        let speedFlickering = dicLevelSingle.object(forKey: "speed") as! String
        iSpeed = speedFlickering.toInt()
        
        bIsSubtraction = true
        
        lblDigitType.isEnabled = false
        lblNumberOfDigit.isEnabled = false
        lblFlickeringSpeed.isEnabled = false
        lblSubtraction.isEnabled = false
        
        lblDigitType.isUserInteractionEnabled = false
        lblNumberOfDigit.isUserInteractionEnabled = false
        lblFlickeringSpeed.isUserInteractionEnabled = false
        lblSubtraction.isUserInteractionEnabled = false
        
        btnSpeedUpFlickering.isHidden = true
        btnSpeedDownFlickering.isHidden = true
        
        ivLevel1.image = UIImage(named: "levelBlueCustomRectButton")!
        ivLevel2.image = UIImage(named: "levelCustomRectButton")!
        ivLevel3.image = UIImage(named: "levelCustomRectButton")!
        ivLevel4.image = UIImage(named: "levelCustomRectButton")!
        
        lblLevel1Text.textColor = UIColor.white
        lblLevel2Text.textColor = UIColor.greyishBrown
        lblLevel3Text.textColor = UIColor.greyishBrown
        lblLevel4Text.textColor = UIColor.greyishBrown
        
        
    }
    
    @objc func ivLevel2TapAction(gesture : UIGestureRecognizer)
    {
        lblDigitType.text = dicLevelDouble.object(forKey: "digitType") as? String
        
        lblNumberOfDigit.text = dicLevelDouble.object(forKey: "numberOfDigit") as? String
        
        lblFlickeringSpeed.text = "\(dicLevelDouble.object(forKey: "speed") as! String)ms"
        
        lblSubtraction.text = dicLevelDouble.object(forKey: "isSubtraction") as? String
        
        
        strCurrentDigitType = "double"
        
         btnLevelDetailTitle.setTitle("Double Digit", for: .normal)
        
        let num = dicLevelDouble.object(forKey: "numberOfDigit") as! String
        iNumberOfDigit = num.toInt()
        
        let speedFlickering = dicLevelDouble.object(forKey: "speed") as! String
        iSpeed = speedFlickering.toInt()
        
        bIsSubtraction = true
        
        
        
        lblDigitType.isEnabled = false
        lblNumberOfDigit.isEnabled = false
        lblFlickeringSpeed.isEnabled = false
        lblSubtraction.isEnabled = false
        
        lblDigitType.isUserInteractionEnabled = false
        lblNumberOfDigit.isUserInteractionEnabled = false
        lblFlickeringSpeed.isUserInteractionEnabled = false
        lblSubtraction.isUserInteractionEnabled = false
        
        btnSpeedUpFlickering.isHidden = true
        btnSpeedDownFlickering.isHidden = true
        
        
        ivLevel1.image = UIImage(named: "levelCustomRectButton")!
        ivLevel2.image = UIImage(named: "levelBlueCustomRectButton")!
        ivLevel3.image = UIImage(named: "levelCustomRectButton")!
        ivLevel4.image = UIImage(named: "levelCustomRectButton")!
        
        lblLevel1Text.textColor = UIColor.greyishBrown
        lblLevel2Text.textColor = UIColor.white
        lblLevel3Text.textColor = UIColor.greyishBrown
        lblLevel4Text.textColor = UIColor.greyishBrown
    }
    
    @objc func ivLevel3TapAction(gesture : UIGestureRecognizer)
    {
        lblDigitType.text = dicLevelThird.object(forKey: "digitType") as? String
        
        lblNumberOfDigit.text = dicLevelThird.object(forKey: "numberOfDigit") as? String
        
        lblFlickeringSpeed.text = "\(dicLevelThird.object(forKey: "speed") as! String)ms"
        
        lblSubtraction.text = dicLevelThird.object(forKey: "isSubtraction") as? String
        
        
        strCurrentDigitType = "triple"
        
        btnLevelDetailTitle.setTitle("Triple Digit", for: .normal)
        
        let num = dicLevelThird.object(forKey: "numberOfDigit") as! String
        iNumberOfDigit = num.toInt()
        
        let speedFlickering = dicLevelThird.object(forKey: "speed") as! String
        iSpeed = speedFlickering.toInt()
        
        bIsSubtraction = true
        
        
        lblDigitType.isEnabled = false
        lblNumberOfDigit.isEnabled = false
        lblFlickeringSpeed.isEnabled = false
        lblSubtraction.isEnabled = false
        
        lblDigitType.isUserInteractionEnabled = false
        lblNumberOfDigit.isUserInteractionEnabled = false
        lblFlickeringSpeed.isUserInteractionEnabled = false
        lblSubtraction.isUserInteractionEnabled = false
        
        btnSpeedUpFlickering.isHidden = true
        btnSpeedDownFlickering.isHidden = true
        
        
        ivLevel1.image = UIImage(named: "levelCustomRectButton")!
        ivLevel2.image = UIImage(named: "levelCustomRectButton")!
        ivLevel3.image = UIImage(named: "levelBlueCustomRectButton")!
        ivLevel4.image = UIImage(named: "levelCustomRectButton")!
        
        lblLevel1Text.textColor = UIColor.greyishBrown
        lblLevel2Text.textColor = UIColor.greyishBrown
        lblLevel3Text.textColor = UIColor.white
        lblLevel4Text.textColor = UIColor.greyishBrown
        
    }
    
    @objc func ivLevel4TapAction(gesture : UIGestureRecognizer)
    {
        lblDigitType.text = dicLevelCustom.object(forKey: "digitType") as? String
        
        lblNumberOfDigit.text = dicLevelCustom.object(forKey: "numberOfDigit") as? String
        
        lblFlickeringSpeed.text = "\(dicLevelCustom.object(forKey: "speed") as! String)ms"
        
        lblSubtraction.text = dicLevelCustom.object(forKey: "isSubtraction") as? String
        
        
        strCurrentDigitType = "single"
        
        btnLevelDetailTitle.setTitle("Customise", for: .normal)
        
        let num = dicLevelCustom.object(forKey: "numberOfDigit") as! String
        iNumberOfDigit = num.toInt()
        
        let speedFlickering = dicLevelCustom.object(forKey: "speed") as! String
        iSpeed = speedFlickering.toInt()
        
        bIsSubtraction = false
        
        
        lblDigitType.isEnabled = true
        lblNumberOfDigit.isEnabled = true
        lblFlickeringSpeed.isEnabled = true
        lblSubtraction.isEnabled = true
        
        lblDigitType.isUserInteractionEnabled = true
        lblNumberOfDigit.isUserInteractionEnabled = true
        lblFlickeringSpeed.isUserInteractionEnabled = true
        lblSubtraction.isUserInteractionEnabled = true
        
        btnSpeedUpFlickering.isHidden = false
        btnSpeedDownFlickering.isHidden = false
        
        
        ivLevel1.image = UIImage(named: "levelCustomRectButton")!
        ivLevel2.image = UIImage(named: "levelCustomRectButton")!
        ivLevel3.image = UIImage(named: "levelCustomRectButton")!
        ivLevel4.image = UIImage(named: "levelBlueCustomRectButton")!
        
        lblLevel1Text.textColor = UIColor.greyishBrown
        lblLevel2Text.textColor = UIColor.greyishBrown
        lblLevel3Text.textColor = UIColor.greyishBrown
        lblLevel4Text.textColor = UIColor.white
    }
    
    
    
    
    @objc func lblDigitTypeTapAction(gesture : UIGestureRecognizer)
    {
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Digit Type", message: "Option to select", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        
            let singleButton = UIAlertAction(title: "Single Digit", style: .default)
            { _ in
                print("Single Digit")
                self.strCurrentDigitType = "single"
                self.lblDigitType.text = "Single"
            }
        actionSheetControllerIOS8.addAction(singleButton)
        
        
        let doubleButton = UIAlertAction(title: "Double Digit", style: .default)
        { _ in
            print("Double Digit")
            self.strCurrentDigitType = "double"
             self.lblDigitType.text = "Double"
        }
        actionSheetControllerIOS8.addAction(doubleButton)
        
        
        let threeButton = UIAlertAction(title: "Triple Digit", style: .default)
        { _ in
            print("triple Digit")
            self.strCurrentDigitType = "triple"
             self.lblDigitType.text = "Triple"
        }
        actionSheetControllerIOS8.addAction(threeButton)
        
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
    }
    
    @objc func lblNumberDigitTapAction(gesture : UIGestureRecognizer)
    {
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Number Of Digits", message: "Option to select", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        
        let singleButton = UIAlertAction(title: "5", style: .default)
        { _ in
            print("5")
            self.iNumberOfDigit = 5
            self.lblNumberOfDigit.text = "\(5)"
        }
        actionSheetControllerIOS8.addAction(singleButton)
        
        
        let doubleButton = UIAlertAction(title: "10", style: .default)
        { _ in
            print("10")
            self.iNumberOfDigit = 10
            self.lblNumberOfDigit.text = "\(10)"
        }
        actionSheetControllerIOS8.addAction(doubleButton)
        
        
        let threeButton = UIAlertAction(title: "15", style: .default)
        { _ in
            print("15")
            self.iNumberOfDigit = 15
            self.lblNumberOfDigit.text = "\(15)"
        }
        actionSheetControllerIOS8.addAction(threeButton)
        
        
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
    }
    
  
    
    @objc func lblSubstractionTapAction(gesture : UIGestureRecognizer)
    {
       
            //Create the AlertController and add Its action like button in Actionsheet
            let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Subtraction", message: "Option to select", preferredStyle: .actionSheet)
        
            let cancelActionButton = UIAlertAction(title: "No", style: .cancel) { _ in
                print("no")
                self.lblSubtraction.text = "No"
                self.bIsSubtraction = false
            }
            actionSheetControllerIOS8.addAction(cancelActionButton)
        
        
            let yesbutton = UIAlertAction(title: "Yes", style: .default)
            { _ in
                print("yes")
              self.lblSubtraction.text = "Yes"
                self.bIsSubtraction = true
            }
            actionSheetControllerIOS8.addAction(yesbutton)
        
            self.present(actionSheetControllerIOS8, animated: true, completion: nil)
        
    }
    
    
    //MARK: - Button Action Methods.
    
    @IBAction func btnMenuTapAction(_ sender: UIButton)
    {
        self.slideMenuController()?.openLeft()
    }
    
    
    @IBAction func btnStartTapAction(_ sender: UIButton)
    {
        appDel.selectNumberOfDigit = self.iNumberOfDigit
        appDel.selectShowSpeed = self.iSpeed
        appDel.selectDigitType = self.strCurrentDigitType
        appDel.selectIsSubtractionEnable = self.bIsSubtraction
        
        
        //navigate to other screen
        let obj : ShowNumberVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowNumberVC") as! ShowNumberVC
        
        obj.iNumberOfDigits = self.iNumberOfDigit
        obj.iShowInterval = self.iSpeed
        obj.strDigitType = self.strCurrentDigitType
        obj.bShowSubtraction = self.bIsSubtraction
        
        self.navigationController?.pushViewController(obj, animated: true)
        
    }
}


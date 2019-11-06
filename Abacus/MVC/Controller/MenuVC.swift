//
//  MenuVC.swift
//  Abacus
//
//  Created by Reena on 05/11/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    
    @IBOutlet weak var vTopView: UIView!
    @IBOutlet weak var vCentreLevel: UIView!
    
    
    @IBOutlet weak var vMenuWithoutLogin: UIView!
    @IBOutlet weak var vLoginOption: UIView!
    
    @IBOutlet weak var vPracticeOption: UIView!
    
    @IBOutlet weak var vFeedbackOption: UIView!
    
    
    
    //MARK: - View Life Cycle Methods.
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        vTopView.backgroundColor = UIColor.cobalt
    
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(vLoginOptionWithoutLoginTapAction))
        
        vLoginOption.isUserInteractionEnabled = true
        vLoginOption.addGestureRecognizer(tapGestureRecognizer)
        
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(vFeedbackOptionWithoutLoginTapAction))
        
        vFeedbackOption.isUserInteractionEnabled = true
        vFeedbackOption.addGestureRecognizer(tapGestureRecognizer1)
        
    }
    
    override func viewWillLayoutSubviews()
    {
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        vCentreLevel.layer.cornerRadius = vCentreLevel.frame.size.width/2
        vCentreLevel.layer.borderColor = UIColor.cobalt.cgColor
        vCentreLevel.layer.borderWidth = 5
    }

    
    
    //MARK: - Custom Methods.
    @objc func vLoginOptionWithoutLoginTapAction(gesture : UIGestureRecognizer)
    {
        let objLogin : LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        
        self.present(objLogin, animated: true, completion: nil)
    }
    
    @objc func vFeedbackOptionWithoutLoginTapAction(gesture : UIGestureRecognizer)
    {
        let obj : FeedbackVC = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackVC") as! FeedbackVC
        
         self.present(obj, animated: true, completion: nil)
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

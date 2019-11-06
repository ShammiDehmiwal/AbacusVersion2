//
//  FeedbackVC.swift
//  Abacus
//
//  Created by Reena on 02/10/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import UIKit
import Messages
import MessageUI

class FeedbackVC: UIViewController,UITextFieldDelegate,UITextViewDelegate,MFMailComposeViewControllerDelegate
{

    @IBOutlet weak var vNameEmailView: InnerDropShadowView!
    
    @IBOutlet weak var vDescView: InnerDropShadowView!
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var tvDesc: UITextView!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    
    @IBOutlet weak var ivBlurView: UIImageView!
    @IBOutlet weak var vSuccessView: UIView!
    
    
    let composeVC = MFMailComposeViewController()
    
    
    //MARK: - View Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //blur view tap.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ivBlurBgFeedbackTapAction))
        
        ivBlurView.isUserInteractionEnabled = true
        ivBlurView.addGestureRecognizer(tapGestureRecognizer)
        
        
      //  vNameEmailView.dro
        
        composeVC.mailComposeDelegate = self
        composeVC.setToRecipients(["shammi@rnaura.com"])// "feedback@techdoquest.com"//infoMegamind@abacus.com
        composeVC.setSubject("Feedback Megamind Abacus")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        vNameEmailView.layer.cornerRadius = 15
        vNameEmailView.layer.masksToBounds = true
        
        vDescView.layer.cornerRadius = 15
        vDescView.layer.masksToBounds = true
        
    }

    
    //MARK: - BUTTON action methods.
    @IBAction func btnBackTapAction(_ sender: UIButton)
    {
       // self.navigationController?.popViewController(animated: true)
          self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSubmitTapAction(_ sender: UIButton)
    {
        if txtName.text!.validateName(name:txtName.text!)
        {
            if appDel.isValidEmail(emailStr: txtEmail.text!)
            {
                if txtPhone.text != ""
                {
                if sender.isSelected
                {
                    guard MFMailComposeViewController.canSendMail() else {
                        let alertController = UIAlertController(title: "Warning", message: "Mail is not supporting on your device.", preferredStyle:UIAlertController.Style.alert)
                        
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                        { action -> Void in
                            // Put your code here
                        })
                        self.present(alertController, animated: true, completion: nil)
                        return
                    }
                    
                    composeVC.setMessageBody("Name : \(txtName.text!)\nEmail: \(txtEmail.text!)\nPhone :\(txtPhone.text!)\n\nDescription :\n\(tvDesc.text!)", isHTML: false)
                    
                    composeVC.setPreferredSendingEmailAddress(txtEmail.text!)
                    
                    self.present(composeVC, animated: true, completion: nil)
                    
                }else
                {
                    
                }
                    
                }else
                {
                    let alertController = UIAlertController(title: "Warning", message: "Please input valid phone number.", preferredStyle:UIAlertController.Style.alert)
                    
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    { action -> Void in
                        // Put your code here
                    })
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }else
            {
                let alertController = UIAlertController(title: "Warning", message: "Please input valid email address.", preferredStyle:UIAlertController.Style.alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                { action -> Void in
                    // Put your code here
                })
                self.present(alertController, animated: true, completion: nil)
            }
            
        }else
        {
            let alertController = UIAlertController(title: "Warning", message: "Please input valid name.", preferredStyle:UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            { action -> Void in
                // Put your code here
            })
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        
      
    }
    
    
    //MARK: - UITextField Delegate Methods.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtName
        {
            txtEmail.becomeFirstResponder()
            
        }else if textField == txtEmail
        {
            txtPhone.becomeFirstResponder()
            
        }else if textField == txtPhone
        {
            txtPhone.resignFirstResponder()
            tvDesc.becomeFirstResponder()
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        //set submit button update.
        if isSubmitEnabled()
        {
            btnSubmit.isSelected = true
            
            btnSubmit.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 9, right: 0)
            
        }else
        {
            btnSubmit.isSelected = false
            
            btnSubmit.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtPhone {
           
            if string == ""
            {
                return true
            }
            
            if textField.text!.count < 10
            {
                return true
                
            }else
            {
                return false
            }
            
        }
        
        return true
    }
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        if textView.text == "Type Here"
        {
            textView.text = ""
             textView.textColor = UIColor.greyishBrown
           
        }else if textView.text == ""
        {
            textView.textColor = UIColor.purplishGrey
            textView.text = "Type Here"
        }
        
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        
        if textView.text == ""
        {
            textView.textColor = UIColor.purplishGrey
            textView.text = "Type Here"
        }else
        {
           textView.textColor = UIColor.greyishBrown
        }
        
        //set submit button update.
        if isSubmitEnabled()
        {
            btnSubmit.isSelected = true
            
             btnSubmit.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 9, right: 0)
            
        }else
        {
            btnSubmit.isSelected = false
            
            btnSubmit.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        
        return true
    }
    
    
    //MARK: - Custom Methods.
    func isSubmitEnabled() -> Bool
    {
        if txtName.text != "" && txtEmail.text != "" && txtPhone.text != "" && tvDesc.text != "" && tvDesc.text != "Type Here"
        {
            return true
            
        }else
        {
            return false
        }
    }
    
    
    @objc func ivBlurBgFeedbackTapAction(gesture : UIGestureRecognizer)
    {
        ivBlurView.isHidden = true
        
        vSuccessView.isHidden = true
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        vSuccessView.layer.add(transition, forKey: kCATransition)
       
        self.view.endEditing(true)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Swift.Error?) {
        
        if result == .sent
        {
            ivBlurView.isHidden = false
            vSuccessView.isHidden = false
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromTop
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            vSuccessView.layer.add(transition, forKey: kCATransition)
        }
        
        
        controller.dismiss(animated: true, completion: nil)
        
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

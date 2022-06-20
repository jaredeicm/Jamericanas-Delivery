//
//  AddCardViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 27/03/22.
//

import UIKit
import ATGValidator

class AddCardViewController: UIViewController {

    
    
    @IBOutlet weak var numberTextView: UITextField!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var numberField: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var logoCard: UIImageView!
//    @IBOutlet weak var statusCardLabel: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueNameCard" {
            let VCname = segue.destination as! NameCardViewController
            VCname.numberValue = numberTextView.text!
            VCname.logoOrigin = logoCard.image
        }
    }
    override func touchesBegan(_ touches: Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberButton.isEnabled = false
        cardView.layer.cornerRadius = 7.0
        
        numberTextView.validationRules = [PaymentCardRule(acceptedTypes:[.visa , .mastercard])]
        numberTextView.validateOnInputChange(true)
        numberTextView.validationHandler = {[weak self] result in
            if self?.numberTextView.text?.isEmpty ?? true {
//                self?.statusCardLabel.text = nil
            }else{
               // var statusString = (result.status == .success ? "✅" : "❌")
                if let type = result.value as? PaymentCardType{
//                    statusString = type.rawValue + " " + statusString
                    self?.logoCard.image = UIImage(named: "\(type.rawValue).png)")
                    
                }
//                self?.statusCardLabel.text = statusString
            }
           // self?.statusCardLabel.isHidden =
//            self?.statusCardLabel.text?.isEmpty ?? true
            self?.numberButton.isEnabled = result.status == .success
        }
        
//        numberTextView.delegate = self
//        numberTextView.addTarget(self, action: #selector(actButton), for: .editingChanged)
    
    }
    

   
}

extension AddCardViewController : UITextFieldDelegate{
    @objc func actButton(_ numberTextView: UITextView){
        if numberTextView.text?.isEmpty == false {
            numberButton.isEnabled = true
            numberField.text = numberTextView.text
        }else{
            numberButton.isEnabled = false
        }
        
    }
}

//
//  AddCardViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 27/03/22.
//

import UIKit
//import CoreData
class AddCardViewController: UIViewController {

    
    
    @IBOutlet weak var numberTextView: UITextField!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var numberField: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberButton: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueNameCard" {
            let VCname = segue.destination as! NameCardViewController
            VCname.numberValue = numberTextView.text!
        }
    }
    override func touchesBegan(_ touches: Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberButton.isEnabled = false
        cardView.layer.cornerRadius = 7.0
        
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

//
//  ExpirationCardViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 30/03/22.
//

import UIKit

class ExpirationCardViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var expirationField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var expirationButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var expirationLabel: UILabel!
    @IBOutlet weak var logoCard: UIImageView!
    var logoOrigin: UIImage!
    
    var inforCard:[String] = ["","","","",""]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCVV"{
            let CVV = segue.destination as! CVVViewController
            CVV.infoCard = inforCard
            CVV.infoCard[2] = expirationField.text!
            CVV.logoOrigin = logoCard.image
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoCard.image = logoOrigin
        expirationButton.isEnabled = false
        cardView.layer.cornerRadius = 7.0
        numberLabel.text = inforCard[0]
        nameLabel.text = inforCard[1]
       // infoCard[0] = numberValue
        // cardInfo[0] = numberValue
        // Do any additional setup after loading the view.
        
        expirationField.delegate = self
        expirationField.addTarget(self, action: #selector(actButton), for: .editingChanged)
        
        // Do any additional setup after loading the view.
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

extension ExpirationCardViewController: UITextFieldDelegate{
    @objc func actButton(_ expirationField:UITextField){
        if expirationField.text?.isEmpty == false{
            expirationButton.isEnabled = true
            expirationLabel.text = expirationField.text
        }else{
            expirationButton.isEnabled = false
        }
    }
}

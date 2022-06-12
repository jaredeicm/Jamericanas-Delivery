//
//  AddNameCardViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 27/03/22.
//

import UIKit

class NameCardViewController: UIViewController {

    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    //@IBOutlet weak var nameView: UIView!
    
    var numberValue: String = ""
    var infoCard:[String] = ["","","","",""]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueExpiration"{
        let VCexpiration = segue.destination as! ExpirationCardViewController
            VCexpiration.inforCard = infoCard
            VCexpiration.inforCard[1] = nameField.text!
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var requestName = CoreDataClass()
        //requestName.getNumber()
        
        nameButton.isEnabled = false
        cardView.layer.cornerRadius = 7.0
        numberLabel.text = numberValue
        infoCard[0] = numberValue
        // cardInfo[0] = numberValue
        // Do any additional setup after loading the view.
        
        nameField.delegate = self
        nameField.addTarget(self, action: #selector(actButton), for: .editingChanged)
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
extension NameCardViewController: UITextFieldDelegate{
    @objc func actButton(_ nameField:UITextField){
        if nameField.text?.isEmpty == false{
            nameButton.isEnabled = true
            nameLabel.text = nameField.text
        }else{
            nameButton.isEnabled = false
        }
    }
}

//
//  CpfViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 05/04/22.
//

import UIKit
import CoreData

class CpfViewController: UIViewController {

    var infoCard: [String] = ["","","","",""]

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cpfField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var expirationLabel: UILabel!
    @IBOutlet weak var logoCard: UIImageView!
    var logoOrigin: UIImage!

    
    @IBAction func returnView(_ sender: Any) {
        infoCard[4] = cpfField.text!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let cardInsert = NSEntityDescription.insertNewObject(forEntityName: "PaymentCards", into: context)
        cardInsert.setValue(infoCard[0], forKey: "number")
        cardInsert.setValue(infoCard[1], forKey: "nameCard")
        cardInsert.setValue(infoCard[2], forKey: "expiration")
        cardInsert.setValue(infoCard[3], forKey: "verificationCode")
        cardInsert.setValue(infoCard[4], forKey: "cpf")
        
        do {
            try context.save()
            print("Data saving sucessfully")
        
        } catch {
            print("Error in saving process")
        }
           
        self.dismiss(animated: true, completion: nil)
       // self.storyboard!.instantiateViewController(withIdentifier: "TableViewController")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSaveCard"{
            
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoCard.image = logoOrigin
        saveButton.isEnabled = false
        cardView.layer.cornerRadius = 7.0

        numberLabel.text = infoCard[0]
        nameLabel.text = infoCard[1]
        expirationLabel.text = infoCard[2]
        
        // Do any additional setup after loading the view.
        cpfField.delegate = self
        cpfField.addTarget(self, action: #selector(actButton), for: .editingChanged)
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


extension CpfViewController: UITextFieldDelegate{
    @objc func actButton(_ cpfField:UITextField){
        if cpfField.text?.isEmpty == false{
            saveButton.isEnabled = true
        }else{
            saveButton.isEnabled = false
        }
    }
}

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
//           // var nameCardSave = CoreDataClass()
//        //  nameCardSave.saveNumber(teste: 123)
//            
////            cardInsert.setValue(numberTextView, for: "number")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberButton.isEnabled = false
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let cardInsert = NSEntityDescription.insertNewObject(forEntityName: "PaymentCards", into: context)
        
        cardView.layer.cornerRadius = 7.0
        
        
        numberTextView.delegate = self
        numberTextView.addTarget(self, action: #selector(actButton), for: .editingChanged)
//        numberTextView.addTarget(self, action: #selector(printNumber), for: .editingChanged)
        
        
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

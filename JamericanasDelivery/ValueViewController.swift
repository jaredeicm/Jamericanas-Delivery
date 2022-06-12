//
//  ValueViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 04/05/22.
//

import UIKit

class ValueViewController: UIViewController {

    var orderPlace : [String] = []

    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var order: UILabel!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var valueButton: UIButton!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paymentSegue" {
            let vcPayment = segue.destination as! ValueOrderViewController
            vcPayment.orderPlace = orderPlace
            vcPayment.orderPlace[3] = valueField.text!
        }
    }

    override func touchesBegan(_ touches : Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeName.text = orderPlace[0]
        address.text = orderPlace[1]
        order.text = orderPlace[2]
        
        orderView.layer.cornerRadius = 5.0;
        orderView.layer.borderWidth = 0.5;
//        placeDetail.layer.shadowColor = .black
        orderView.layer.shadowOpacity = 0.4;
        orderView.layer.shadowRadius = 5.0;
        
        valueField.layer.borderColor = UIColor.yellow.cgColor
         //orderDetail.layer.borderWidth = 1
        valueField.layer.borderWidth = 1
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
extension ValueViewController: UITextFieldDelegate {
        @objc func actButton(_ valueField: UITextField) {
        if valueField.text?.isEmpty == false {
            valueButton.isEnabled = true

        } else {
            valueButton.isEnabled = false
        }
      }
}

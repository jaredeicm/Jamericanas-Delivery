//
//  OrderViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 05/03/22.
//

import UIKit
import SwiftUI

class OrderViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var orderTextView: UIView! // TESTING
    
    @IBOutlet weak var orderView: UIView!
    
    @IBOutlet weak var valueButton: UIButton!
    //@IBOutlet weak var valueButton: UIButton! // TESTING HIDE BUTTON
    
    var placeDetailText : String = "Place Selected"
    var orderPlace : [String] = []
    //Labels useds for hide functions
//    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
      ///
  //  @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var order: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var orderDetail: UITextView!
    
    override func touchesBegan(_ touches : Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "valueOrderSegue"{
            var vcvalueOrder = segue.destination as! ValueViewController
           // vcvalueOrder.orderDetailText = (placeDetailText  + "\n" + orderDetail.text! + "\n \n" + valueField.text!)
            vcvalueOrder.orderPlace = orderPlace
            vcvalueOrder.orderPlace[2] = orderDetail.text!
           // orderPlace[3] = valueField.text!
            
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueButton.isEnabled = false
        placeName.text = orderPlace[0]
        addressLabel.text = orderPlace[1]
        
        orderTextView.layer.cornerRadius = 5.0;
        orderTextView.layer.borderWidth = 0.5;
//        placeDetail.layer.shadowColor = .black
        orderTextView.layer.shadowOpacity = 0.4;
        orderTextView.layer.shadowRadius = 5.0;
       // let borderColor = UIColor(yellow)
        orderDetail.layer.borderWidth = 1
       // valueField.layer.borderWidth = 1
        orderDetail.layer.borderColor = UIColor.yellow.cgColor
      //  valueField.layer.borderColor = UIColor.yellow.cgColor
        
       // orderDetail.delegate = self
        self.orderDetail.delegate = self
        
      //  valueField.delegate = self
        //orderButton.isEnabled = false
       // valueField.addTarget(self, action: #selector(actButton), for: .editingChanged)
//        orderDetail.(self, action: #selector(valueButtonEnable), for: .editingChanged)
        
        
        
        
        // Do any additional setup after loading the view.
    }
  
//    @IBAction func firstScene(_ valueButton: UIButton) {
//        valueButton.isHidden = true
//        orderDetail.isHidden = true
//        orderLabel.isHidden = true
//        orderButton.isHidden = false
//        orderButton.isEnabled = false
//        valueLabel.isHidden = false
//        valueField.isHidden = false
//        orderView.isHidden = true
//        order.text = orderDetail.text
//    }
    
}
    extension OrderViewController: UITextFieldDelegate {
//        @objc func actButton(_ valueField: UITextField) {
//        if valueField.text?.isEmpty == false {
//            orderButton.isEnabled = true
//
//        } else {
//            orderButton.isEnabled = false
//        }
//      }
//        @objc func valueButtonEnable(_ orderDetail: UITextView){
//            if orderDetail.text?.isEmpty == false {
//                valueButton.isEnabled = true
//            }else{
//                valueButton.isEnabled = false
//            }
    
        
        // ESSE DEU CERTO
        func textViewDidChange(_ orderDetail: UITextView){
            if orderDetail.text?.isEmpty == false {
                valueButton.isEnabled = true
            }else{
                valueButton.isEnabled = false
            }
        }
}



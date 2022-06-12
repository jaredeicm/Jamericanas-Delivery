//
//  CompleteOrderViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 15/04/22.
//

import UIKit

class CompleteOrderViewController: UIViewController {

    //@IBOutlet weak var orderDetail: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var orderTextView: UIView!
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    
    var cardSelected : String = ""
    var orderDetailText: String = ""
    var orderPlace : [String] = []

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFinal" {
            let VCFinal = segue.destination as! FinallyViewController
            //VCFinal.orderdetailText = orderDetailText
            VCFinal.orderPlace = orderPlace
        }
    }
    
    override func touchesBegan(_ touches : Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderTextView.layer.cornerRadius = 5.0;
        orderTextView.layer.borderWidth = 0.5;
//        placeDetail.layer.shadowColor = .black
        orderTextView.layer.shadowOpacity = 0.4;
        orderTextView.layer.shadowRadius = 5.0;
        
        //orderDetail.text = orderDetailText
        cardLabel.text = cardSelected
        
        placeName.text = orderPlace[0]
        placeAddress.text = orderPlace[1]
        orderLabel.text = orderPlace[2]
        orderPrice.text = orderPlace[3]
        
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

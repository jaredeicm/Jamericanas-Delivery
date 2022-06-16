//
//  FinallyViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 15/04/22.
//

import UIKit

class FinallyViewController: UIViewController {

    //@IBOutlet weak var orderDetail: UILabel!
    var orderdetailText : String = ""
    @IBOutlet weak var orderTextView: UIView!
    var orderPlace : [String] = []

    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    
    
    //@IBAction func teste(_ sender: Any) {
//        self.performSegue(withIdentifier: "unwindToSeach", sender: self)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orderTextView.layer.cornerRadius = 5.0;
        orderTextView.layer.borderWidth = 0.5;
//        placeDetail.layer.shadowColor = .black
        //orderTextView.layer.shadowOpacity = 0.4;
        orderTextView.layer.shadowRadius = 5.0;
        
        //orderDetail.text = orderDetailText
        //cardLabel.text = cardSelected
        
        placeName.text = orderPlace[0]
        placeAddress.text = orderPlace[1]
        orderLabel.text = orderPlace[2]
        orderPrice.text = orderPlace[3]
        //orderDetail.text = orderdetailText
        
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

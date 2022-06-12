//
//  ValueOrderViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 11/03/22.
//

import UIKit

class ValueOrderViewController: UIViewController {

    @IBOutlet weak var orderTextView: UIView!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var selectCard: UIView!
    //@IBOutlet weak var cardSelected: UIView!
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    
    
    var orderDetailText:String = ""
    var orderPlace : [String] = []
    //var orderComplete:[String] = []
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueCardsTable" {
//         //  let VCCards = segue.destination as! TableViewController
//           // VCCards.orderDetail = orderDetailText
//        }
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCardsTable"{
            let VCCards = segue.destination as! TableViewController
                //VCCards.orderDetail = orderDetailText
            VCCards.orderPlace = orderPlace
        }
    }
    
    override func touchesBegan(_ touches : Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeName.text = orderPlace[0]
        placeAddress.text = orderPlace[1]
        orderLabel.text = orderPlace[2]
        orderPrice.text = orderPlace[3]
        
        orderTextView.layer.cornerRadius = 5.0;
        orderTextView.layer.borderWidth = 0.5;
//        placeDetail.layer.shadowColor = .black
        orderTextView.layer.shadowOpacity = 0.4;
        orderTextView.layer.shadowRadius = 5.0;
        
        
        selectCard.layer.cornerRadius = 5.0;
        selectCard.layer.borderWidth = 0.5;
//        placeDetail.layer.shadowColor = .black
        selectCard.layer.shadowOpacity = 0.4;
        selectCard.layer.shadowRadius = 5.0;
        
        selectCard.layer.borderColor = UIColor.yellow.cgColor
        
    }
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        3
//    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

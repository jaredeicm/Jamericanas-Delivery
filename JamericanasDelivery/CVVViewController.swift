//
//  CVVViewController.swift
//  JamericanasDelivery
//
//  Created by DELIVERY on 04/04/22.
//

import UIKit

class CVVViewController: UIViewController {

    var infoCard: [String] = ["","","","",""]
    @IBOutlet weak var cvvLabel: UILabel!
    @IBOutlet weak var cvvView: UIView!
    @IBOutlet weak var cvvButton: UIButton!
    @IBOutlet weak var cvvField: UITextField!
    var logoOrigin: UIImage!

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCpf"{
            let VCCpf = segue.destination as! CpfViewController
            VCCpf.infoCard = infoCard
            VCCpf.infoCard[3] = cvvLabel.text!
            VCCpf.logoOrigin = logoOrigin
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch> , with event: UIEvent?){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cvvButton.isEnabled = false
        cvvView.layer.cornerRadius = 7.0

        // Do any additional setup after loading the view.
        cvvField.delegate = self
        cvvField.addTarget(self, action: #selector(actButton), for: .editingChanged)
        
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


extension CVVViewController: UITextFieldDelegate{
    @objc func actButton(_ cvvField:UITextField){
        if cvvField.text?.isEmpty == false{
            cvvButton.isEnabled = true
            cvvLabel.text = cvvField.text
        }else{
            cvvButton.isEnabled = false
        }
    }
}

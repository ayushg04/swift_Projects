//
//  ViewController.swift
//  MyApp1
//
//  Created by daffolapmac-179 on 19/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceTextField:
        UITextField!
    
    @IBOutlet weak var salesTextField:
        UITextField!
    
    @IBOutlet weak var priceLabel:
        UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text=""
    }

    @IBAction func didTapCalculateButton(_ sender: UIButton) {
        guard let price = priceTextField.text, price.count > 0, let sales = salesTextField.text, sales.count > 0 else {
            print("Both field are mandatory")
            return
        }
        
        print(price, sales)
        
//        let totalSales = price*sales
//        let totalprice = price+totalSales
//        pricelbl.text = "$\(totalprice)"
    }
    
}


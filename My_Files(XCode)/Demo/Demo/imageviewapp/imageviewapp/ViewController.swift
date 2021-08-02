//
//  ViewController.swift
//  imageviewapp
//
//  Created by daffolapmac-179 on 26/10/20.
//

import UIKit

class ViewController:
    
    UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let elements = ["imageviewapp[1640:190448] Could not load the  image referenced from a nib in the bundle with identifier com.demo.imageviewapp","two","three","four","five","six"]
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.cellLabel.numberOfLines = 0
        
        cell.cellLabel.text = elements[indexPath.row]
        //cell.cellImage.image = UIImage[named: elements[indexPath.row]]
        
        
        return cell
    }


}


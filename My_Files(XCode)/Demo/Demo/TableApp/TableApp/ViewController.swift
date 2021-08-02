//
//  ViewController.swift
//  TableApp
//
//  Created by daffolapmac-179 on 26/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var exampleContent = ["This is a very short text.","This a bit long text,not much longer but longer than the text1.","This is really longest text, longer than both the previous texts,everyone can see it how it actually works."]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You have tapped row "+"\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleContent.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //let content = exampleContent[indexPath.row]
        
        cell.textLabel?.text = exampleContent[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        //cell.textLabel?.text = content
        
        return cell
    }
}


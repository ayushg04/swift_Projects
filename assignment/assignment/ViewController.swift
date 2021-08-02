//
//  ViewController.swift
//  assignment
//
//  Created by daffolapmac-179 on 06/01/21.
//

import UIKit
struct  CellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
    
}

class TableViewController: UITableViewController {
    var tableviewData = [CellData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableviewData = [CellData(opened: false, title: "Title1", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title2", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title3", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"])]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        tableviewData.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableviewData[section].opened == true{
            return tableviewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableviewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableviewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableviewData[indexPath.section].opened == true {
                tableviewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                tableviewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
}


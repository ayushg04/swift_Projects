//
//  ViewController.swift
//  EMS
//
//  Created by daffolapmac-179 on 02/11/20.
//

import UIKit


class TableViewCell:UITableViewCell{
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
}

class HomeViewController: UIViewController{

    @IBOutlet private weak var addButton: UIBarButtonItem!
    @IBOutlet private weak var employeesTableView: UITableView!
    
    var employees: [Employee] = []
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesTableView.delegate = self
        employeesTableView.dataSource = self
        
        
        // Fetch data from Userdefault which is saved
        employees = UserDefaultUtility.sharedInstance.getEmployees()
    }
    
    
    @IBAction func didTapAddButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC: SecondViewController = storyBoard.instantiateViewController(identifier: "SecondViewController")
        detailVC.type = .add
        detailVC.delegate = self
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func editEmployeee(at index: Int) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC: SecondViewController = storyBoard.instantiateViewController(identifier: "SecondViewController")
        detailVC.type = .edit
        detailVC.delegate = self
        detailVC.employee = employees[index]
        detailVC.index = index
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func detail(at index: Int) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC: SecondViewController = storyBoard.instantiateViewController(identifier: "SecondViewController")
        detailVC.type = .detail
        detailVC.delegate = self
        detailVC.employee = employees[index]
        detailVC.index = index
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detail(at: indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let employee = employees[indexPath.row]
        
        cell.textLabel?.numberOfLines = 0
        cell.nameLbl?.text = employee.name
        cell.emailLbl?.text = employee.email
        return cell
    }
}


// MARK: - SecondViewControllerDelegate
extension HomeViewController: SecondViewControllerDelegate {
    func update(employee: Employee?, at index: Int) {
        guard let employee = employee  else { return }

        // Update updated data of employee in employee list
        employees[index] = employee
        
        // Save Data in User Default
        UserDefaultUtility.sharedInstance.save(emplyees: employees)
        
        // Reload List
        employeesTableView.reloadData()
    }
    
    func add(employee: Employee?) {
        guard let employee = employee  else { return }
        
        // Add employee in employee list
        employees.append(employee)
        
        // Save Data in User Default
        UserDefaultUtility.sharedInstance.save(emplyees: employees)
        
        // Reload List
        employeesTableView.reloadData()

    }
}




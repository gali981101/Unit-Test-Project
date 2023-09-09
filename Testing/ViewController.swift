//
//  ViewController.swift
//  Testing
//
//  Created by Terry Jason on 2023/9/9.
//

import UIKit

class ViewController: UIViewController {

    var todoList = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }

    @IBAction func addClicked(_ sender: Any) {
        makeAlert(title: "Add Item", message: "Enter Your Things")
    }
    
}


// MARK: UITableView Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = todoList[indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}


// MARK: Alert

extension ViewController {
    
    private func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Enter Item"
        }
        
        let okButton = UIAlertAction(title: "submit", style: .default) { [self] action in
            handleTextField(alert: alert)
        }
        
        
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }
    
}


// MARK: Func

extension ViewController {
    
    private func handleTextField(alert: UIAlertController) {
        guard let field = alert.textFields?[0], let inputText = field.text, !inputText.isEmpty else { return }
        
        todoList.insert(inputText, at: 0)
        tableView.insertRows(at: [.init(row: 0, section: 0)], with: .fade)
    }
    
}

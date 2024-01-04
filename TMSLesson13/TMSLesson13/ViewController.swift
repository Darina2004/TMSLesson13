//
//  ViewController.swift
//  TMSLesson13
//
//  Created by Mac on 4.01.24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let languages = ["Swift", "Java", "Python", "JavaScript", "C++", "Ruby", "PHP", "Objective-C", "C#", "Go"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            cell.textLabel?.text = "\(indexPath.row)"
            cell.detailTextLabel?.text = "Section \(indexPath.section)"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 16)
            return cell
        } else {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            let language = languages[indexPath.row]
            cell!.textLabel?.text = language
            cell!.textLabel?.font = UIFont.systemFont(ofSize: 17)
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Numbers" : "Programming Languages"
    }
}

//1. Вывести 20 ячеек в таблице. В label ячейки укажите текущий индекс. Используйте стандартную ячейку.
//2. Вывести 10 языков программирования. Ячейка должна содержать два Label.
//3. Вывести 20 ячеек. Для первых 10 ячеек выводится в textLabel текущий индекс, в detailTextLabel текущая секция, стиль ячейки с двумя label. Для вторых 10 выводятся языки программирования, у ячеек стиль стандартный с одним label. Итого таблица с 20 ячейками.

//
//  ActivitatiViewController.swift
//  ListaToDo
//
//  Created by Dragos Florin on 9/23/16.
//  Copyright © 2016 Dragos Florin. All rights reserved.
//

import UIKit

class ActivitatiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tascuri : [Task] = []
    var indexSelectat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tascuri = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tascuri.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tascuri [indexPath.row]
        if task.important {
            cell.textLabel?.text = "‼️ \(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelectat = indexPath.row
        let task = tascuri[indexPath.row]
        performSegue(withIdentifier: "selecteazaActivitatiSegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Da-i blana"
        task1.important = true
        
        let task2 = Task()
        task2.name = "Nu-i panica"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Mananca"
        task3.important = true
        return[task1, task2, task3]
    }
    @IBAction func butonApasat(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let urmatorulVC = segue.destination as! CreazaActivitateViewController
            urmatorulVC.anteriorVC = self
        }
        
        if segue.identifier == "selecteazaActivitatiSegue" {
            let urmatorulVC = segue.destination as! ActivitateCompletaViewController
            urmatorulVC.task = sender as! Task
            urmatorulVC.anteriorVC = self
        }
    }
    
}

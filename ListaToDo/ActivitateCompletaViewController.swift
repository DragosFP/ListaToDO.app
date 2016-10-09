//
//  ActivitateCompletaViewController.swift
//  ListaToDo
//
//  Created by Dragos Florin on 10/9/16.
//  Copyright © 2016 Dragos Florin. All rights reserved.
//

import UIKit

class ActivitateCompletaViewController: UIViewController {
    
    @IBOutlet weak var labelTask: UILabel!
    
    //var task = Task()
    
    var task: Task? = nil
    
   // var anteriorVC = ActivitatiViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if task!.important {
            labelTask.text = "‼️ \(task!.name!)"
        } else {
            labelTask.text = task!.name!
        }
    }
    
    @IBAction func Complet(_ sender: AnyObject) {
       // anteriorVC.tascuri.remove(at: anteriorVC.indexSelectat)
      //  anteriorVC.tableView.reloadData()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}

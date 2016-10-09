//
//  CreazaActivitateViewController.swift
//  ListaToDo
//
//  Created by Dragos Florin on 10/4/16.
//  Copyright © 2016 Dragos Florin. All rights reserved.
//

import UIKit

class CreazaActivitateViewController: UIViewController {

    @IBOutlet weak var Schimbator: UISwitch!
    @IBOutlet weak var CampNume: UITextField!
    
    var anteriorVC = ActivitatiViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButonAdaugaApasat(_ sender: AnyObject) {
        // Creaza Activitate(task)
        let activitate = Task()
        activitate.name = CampNume.text!
        activitate.important = Schimbator.isOn
        
        // Salveaza aceasta activitate intr-un array pe priviousviewcontroler
       anteriorVC.tascuri.append(activitate)
        anteriorVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }

}

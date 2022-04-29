//
//  ProjectViewController.swift
//  Kanbo
//
//  Created by Jason Lauwrin on 27/04/22.
//

import UIKit

class ProjectViewController:UIViewController{
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameOfProject: UITextField!
    var textNameValue:String?
    
    @IBOutlet weak var descOfProject: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.date = selectedDate
    }
    
    @IBAction func saveProject(_ sender: Any) {
        let newProject = Project()
        newProject.id = projectList.count
        newProject.name = nameOfProject.text
        newProject.desc = descOfProject.text
        newProject.date = datePicker.date
        
//        textNameValue = nameOfProject.text
//        performSegue(withIdentifier: "toProjectDescViewController", sender: nil)
        
        projectList.append(newProject)
        navigationController?.popViewController(animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let nextVC = segue.destination
//        as? ProjectDescViewController
//        nextVC?.receivedName = textNameValue
//    }
}

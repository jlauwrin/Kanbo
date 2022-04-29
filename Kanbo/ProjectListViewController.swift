//
//  ProjectView.swift
//  Kanbo
//
//  Created by Jason Lauwrin on 27/04/22.
//

import UIKit

var selectedDate = Date()

class ProjectListViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Project().showProject().count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectID") as! ProjectCell
        
        let project = Project().showProject()[indexPath.row]
        
        cell.projectName.text =  Schedule().monthDesc(date: project.date) + " " + Schedule().yearDesc(date: project.date) + " - " + project.name
        return cell
    }
    
    
//    @IBAction func taskBtn(_ sender: Any) {
//        textFi
//    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}

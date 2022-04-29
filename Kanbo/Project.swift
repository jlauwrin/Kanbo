//
//  Project.swift
//  Kanbo
//
//  Created by Jason Lauwrin on 27/04/22.
//

import Foundation

var projectList = [Project]()

class Project{
    var id:Int!
    var name:String!
    var desc:String!
    var date:Date!
    
    func projectForDate(date:Date)->[Project]{
        var daysProject = [Project]()
        for project in projectList {
            if(Calendar.current.isDate(project.date, inSameDayAs: date)){
                daysProject.append(project)
            }
        }
        return daysProject
    }
    
    func showProject()->[Project]{
        var allProject = [Project]()
        for project in projectList {
            allProject.append(project)
        }
        return allProject
    }
    
    
    
}

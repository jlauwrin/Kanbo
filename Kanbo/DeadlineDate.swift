//
//  DeadlineDate.swift
//  Kanbo
//
//  Created by Jason Lauwrin on 27/04/22.
//

import UIKit

class DeadlineDate:UIViewController,
                   UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var totalSquares = [Date]()
    var selectedDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
    }
    
    func setCellsView(){
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setMonthView(){
        totalSquares.removeAll()
        
        var current = Schedule().sundayDate(date: selectedDate)
        let nextSunday = Schedule().addDay(date: current, days: 7)
        
        while (current < nextSunday)
        {
            totalSquares.append(current)
            current = Schedule().addDay(date: current, days: 1)
        }
        
        monthLbl.text = Schedule().monthDesc(date: selectedDate)
            + " " + Schedule().yearDesc(date: selectedDate)
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        
        let date = totalSquares[indexPath.item]
        cell.dateDesc.text = String(Schedule().daysOfMonth(date: date))
        
        if(date == selectedDate)
        {
            cell.backgroundColor = UIColor.systemGreen
            
        }
        else
        {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedDate = totalSquares[indexPath.item]
        collectionView.reloadData()
        tableView.reloadData()
        
    }
    
    @IBAction func prevMonth(_ sender: Any) {
        selectedDate = Schedule().addDay(date: selectedDate, days: -7)
        setMonthView()
    }
    
    @IBAction func nextMonth(_ sender: Any) {
        selectedDate = Schedule().addDay(date: selectedDate, days: 7)
        setMonthView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Project().projectForDate(date: selectedDate).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! ProjectCell
        
        let project = Project().projectForDate(date: selectedDate)[indexPath.row]
        
        cell.projectName.text = project.name + "\n" + project.desc + " " + Schedule().timeDesc(date: project.date)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}

//
//  Schedule.swift
//  Kanbo
//
//  Created by Jason Lauwrin on 26/04/22.
//

import UIKit

class Schedule{
    let calendar = Calendar.current
    
    func plusMonth(date: Date)->Date{
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minMonth(date: Date)->Date{
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func monthDesc(date:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    
    func yearDesc(date:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="yyyy"
        return dateFormatter.string(from: date)
    }
    
    func timeDesc(date:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func daysInMonth(date:Date)->Int{
        let range=calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func daysOfMonth(date: Date)->Int{
        let component = calendar.dateComponents([.day], from: date)
        return component.day!
    }
    
    
    
    
    
    func firstMonth(date: Date)->Date{
        let component = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: component)!
    }
    
    func weekDay(date:Date)->Int{
        let component = calendar.dateComponents([.weekday], from: date)
        return component.weekday!-1
    }
    
    func addDay(date:Date, days:Int)->Date{
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    
    func sundayDate(date:Date)->Date{
        var curr = date
        let oneWeek = addDay(date: curr, days: -7)
        
        while(curr>oneWeek){
            let currWeek = calendar.dateComponents([.weekday], from: curr).weekday
            if(currWeek==1){
                return curr
            }
            curr = addDay(date: curr, days: -1)
        }
        return curr
    }
}

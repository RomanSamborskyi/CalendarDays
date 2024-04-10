//
//  Engine.swift
//  CalendarDays
//
//  Created by Roman Samborskyi on 10.04.2024.
//

import UIKit


public class CalendaDaysComponent {
    
    public static func fetchDays(for month: Date) -> [CalendarDays] {
        let currentCalendar = Calendar.current
        
        let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "LLLL yyyy"
            return dateFormatter
        }()
        
        let currentMonth = dateFormatter.date(from: dateFormatter.string(from: month))
        
        let returnedMonth = currentCalendar.date(bySetting: .day, value: 1, of: currentMonth!)
        
        var monthsDays: [CalendarDays] = returnedMonth!.daysOfMonth().map {
            CalendarDays(day: currentCalendar.component(.day, from: $0), date: $0)
        }
        
        let firstDayOfTheWeek = currentCalendar.component(.weekday, from: monthsDays.first?.date ?? Date())
        if firstDayOfTheWeek > 1 {
            for _ in 0..<firstDayOfTheWeek - 2 {
                monthsDays.insert(CalendarDays(day: -1, date: Date()), at: 0)
            }
        } else if firstDayOfTheWeek <= 1 {
            for _ in -7..<firstDayOfTheWeek - 2 {
                monthsDays.insert(CalendarDays(day: -1, date: Date()), at: 0)
            }
        }
        
        return monthsDays
    }
}

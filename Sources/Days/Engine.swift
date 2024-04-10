//
//  Engine.swift
//  CalendarDays
//
//  Created by Roman Samborskyi on 10.04.2024.
//

import UIKit


public class CalendaDaysComponent {
    
    public static func fetchDays(for month: Date) -> [Days] {
        let currentCalendar = Calendar.current
        
        var monthsDays: [Days] = month.daysOfMonth().map {
            Days(day: currentCalendar.component(.day, from: $0), date: $0)
        }
        
        let firstDayOfTheWeek = currentCalendar.component(.weekday, from: monthsDays.first?.date ?? Date())
        if firstDayOfTheWeek > 1 {
            for _ in 0..<firstDayOfTheWeek - 2 {
                monthsDays.insert(Days(day: -1, date: Date()), at: 0)
            }
        } else if firstDayOfTheWeek <= 1 {
            for _ in -7..<firstDayOfTheWeek - 2 {
                monthsDays.insert(Days(day: -1, date: Date()), at: 0)
            }
        }
        
        return monthsDays
    }
}

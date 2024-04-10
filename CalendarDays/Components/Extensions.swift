//
//  Extensions.swift
//  CalendarDays
//
//  Created by Roman Samborskyi on 10.04.2024.
//

import Foundation


public extension Date {
    func daysOfMonth() -> [Date] {
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: self)
        let currentYear = calendar.component(.year, from: self)
        var startComponents = DateComponents()
        
        startComponents.year = currentYear
        startComponents.month = currentMonth
        startComponents.day = 1
        let startDate = calendar.date(from: startComponents)!
        
        var endComponents = DateComponents()
        
        endComponents.month = currentMonth
        endComponents.day = -1
        
        let endDate = calendar.date(byAdding: endComponents, to: startDate)!
        
        var dates: [Date] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        return dates
    }
}

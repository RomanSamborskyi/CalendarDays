//
//  Days.swift
//  CalendarDays
//
//  Created by Roman Samborskyi on 10.04.2024.
//

import UIKit


public struct CalendarDays: Identifiable {
    public let id: UUID = UUID()
    public let day: Int
    public let date: Date
}

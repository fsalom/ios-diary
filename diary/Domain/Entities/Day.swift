//
//  Day.swift
//  diary
//
//  Created by Fernando Salom Carratala on 22/6/24.
//

import Foundation

struct Day: Identifiable {
    let id = UUID()
    let number: Int
    let isWithinDisplayedMonth: Bool
}

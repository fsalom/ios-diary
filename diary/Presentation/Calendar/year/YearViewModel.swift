//
//  YearViewModel.swift
//  diary
//
//  Created by Fernando Salom Carratala on 22/6/24.
//

import Foundation

class YearViewModel: ObservableObject {
    let months: [Date] = {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        var dates = [Date]()
        for month in 1...12 {
            let components = DateComponents(year: year, month: month)
            if let date = calendar.date(from: components) {
                dates.append(date)
            }
        }
        return dates
    }()

}

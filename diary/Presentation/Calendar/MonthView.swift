//
//  CalendarView.swift
//  diary
//
//  Created by Fernando Salom Carratala on 22/6/24.
//

import SwiftUI

struct MonthView: View {
    let month: Date
    let viewModel = MonthViewModel()

    private var days: [Day] {
        viewModel.generateDaysStartingMonday(for: month)
    }

    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
            VStack {
                Text(viewModel.monthName(from: month))
                    .font(.footnote)
                HStack {
                    ForEach(viewModel.weekDaysSingle, id: \.self) { day in
                        Text(day)
                            .font(.footnote)
                            .frame(maxWidth: .infinity)
                    }
                }
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(days) { day in
                        DayView(day: day)
                    }
                }
            }
            .padding()
        }
}

#Preview {
    MonthView(month: Date())
}

//
//  CalendarViewModel.swift
//  diary
//
//  Created by Fernando Salom Carratala on 22/6/24.
//

import Foundation

class MonthViewModel: ObservableObject {

    let weekDays = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"]
    let weekDaysSingle = ["L", "M", "X", "J", "V", "S", "D"]

    func monthName(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }

    func generateDaysStartingSunday(for month: Date) -> [Day] {
        var calendar = Calendar.current
        calendar.firstWeekday = 1 // Domingo = 1, Lunes = 2, etc.

        // Rango de días en el mes
        let range = calendar.range(of: .day, in: .month, for: month)!

        // Primer día del mes
        let firstOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!

        // Primer día de la semana del primer día del mes
        let firstDayOfWeek = calendar.component(.weekday, from: firstOfMonth)

        // Celdas previas a los días del mes
        var days: [Day] = (1..<firstDayOfWeek).map { _ in Day(number: 0, isWithinDisplayedMonth: false) }

        // Agregar los días del mes
        days += range.map { Day(number: $0, isWithinDisplayedMonth: true) }

        // Total de celdas debe ser múltiplo de 7 para completar la cuadrícula
        while days.count % 7 != 0 {
            days.append(Day(number: 0, isWithinDisplayedMonth: false))
        }

        return days
    }

    func generateDaysStartingMonday(for month: Date) -> [Day] {
        var calendar = Calendar.current
        calendar.firstWeekday = 2 // Lunes = 2

        // Rango de días en el mes
        let range = calendar.range(of: .day, in: .month, for: month)!

        // Primer día del mes
        let firstOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!

        // Primer día de la semana del primer día del mes
        let firstDayOfWeek = calendar.component(.weekday, from: firstOfMonth)

        // Ajustar las celdas previas según el primer día de la semana
        let offset = (firstDayOfWeek + 5) % 7 // Ajuste para que Lunes sea el primer día
        var days: [Day] = (0..<offset).map { _ in Day(number: 0, isWithinDisplayedMonth: false) }

        // Agregar los días del mes
        days += range.map { Day(number: $0, isWithinDisplayedMonth: true) }

        // Total de celdas debe ser múltiplo de 7 para completar la cuadrícula
        while days.count % 7 != 0 {
            days.append(Day(number: 0, isWithinDisplayedMonth: false))
        }

        return days
    }
}

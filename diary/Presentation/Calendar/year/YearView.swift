//
//  YearView.swift
//  diary
//
//  Created by Fernando Salom Carratala on 22/6/24.
//

import SwiftUI

struct YearView: View {
    let viewModel = YearViewModel()

    private let columns = Array(repeating: GridItem(.flexible(), alignment: .top), count: 3)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(viewModel.months, id: \.self) { month in
                    MonthView(month: month)
                }
            }
        }.padding(4)
    }
}

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        YearView()
    }
}

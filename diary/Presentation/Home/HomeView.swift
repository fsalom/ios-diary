//
//  ContentView.swift
//  diary
//
//  Created by Fernando Salom Carratala on 22/6/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    private var data  = Array(1...31)
    private let flexibleColumn = [
        GridItem(.flexible(minimum: 20, maximum: 30)),
        GridItem(.flexible(minimum: 20, maximum: 30)),
        GridItem(.flexible(minimum: 20, maximum: 30))
    ]

    var body: some View {
        ScrollView{
            GeometryReader { proxy in
                if let gridSize = viewModel.gridSize {
                    EmptyView()
                        .onAppear {
                            viewModel.calculate(with: proxy.size)
                        }
                } else {
                    Grid {
                        ForEach(data, id: \.self) { item in
                            Text("")
                                .frame(width: 25, height: 20, alignment: .center)
                                .background(.blue)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                    LazyHGrid(rows: flexibleColumn, spacing: 10) {
                        ForEach(data, id: \.self) { item in
                            Text("")
                                .frame(width: 25, height: 20, alignment: .center)
                                .background(.blue)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }

                }
            }
        }
    }
}

#Preview {
    HomeView()
}

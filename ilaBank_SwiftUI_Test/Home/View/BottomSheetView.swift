//
//  BottomSheetView.swift
//  ilaBank_SwiftUI_Test
//
//  Created by Neosoft on 01/07/24.
//

import SwiftUI

struct CharacterOccurrenceData: Hashable {
    let character: String
    let count: Int
}

struct BottomSheetView: View {
    
    @Binding var selection: Int
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Group {
                if let listData = viewModel.uiModel.carouselData?[selection].listData as? [ListData] {
                    let titles = listData.map { $0.title }
                    let dict = viewModel.topThreeCharacters(in: titles)
                    List {
                        Section(header: Text("List \(selection + 1) (\(listData.count) items)")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                        ) {
                            ForEach(dict, id: \.self) { model in
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("\(model.character) = \(model.count)")
                                        .font(.caption)
                                        .textCase(.uppercase)
                                        .padding([.leading, .trailing], 10)
                                        .padding(.bottom, 5)
                                    Divider()
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
    }
}

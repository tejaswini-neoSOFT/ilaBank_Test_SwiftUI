//
//  HomeView.swift
//  ilaBank_SwiftUI_Test
//
//  Created by Neosoft on 01/07/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    init() {
        viewModel.loadData()
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    CarouselCollection(selection: $viewModel.uiModel.selection, viewModel: viewModel)
                        .listRowInsets(EdgeInsets())
                    Divider()
                    Section(header: SearchBar(searchText: $viewModel.uiModel.searchText)) {
                        Divider()
                        ListCellView(selection: $viewModel.uiModel.selection, searchText: $viewModel.uiModel.searchText, viewModel: viewModel)
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            BottomButtonView(showBottomSheet: $viewModel.uiModel.showBottomSheet)
        }
        .sheet(isPresented: $viewModel.uiModel.showBottomSheet) {
            BottomSheetView(selection: $viewModel.uiModel.selection, viewModel: viewModel)
                .presentationDetents([.height(215)])
        }
    }
}

#Preview {
    HomeView()
}

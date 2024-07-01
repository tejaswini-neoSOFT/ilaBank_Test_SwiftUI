//
//  ListCellView.swift
//  ilaBank_SwiftUI_Test
//
//  Created by Neosoft on 01/07/24.
//

import SwiftUI

struct ListCellView: View {
    
    @Binding var selection: Int
    @Binding var searchText: String
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.uiModel.filteredList, id: \.self) { listObj in
                HStack {
                    Image(listObj.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 50)
                        .clipped()
                    Text(listObj.title)
                        .padding(.leading, 10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 5)
                .listRowInsets(EdgeInsets())
                
                Divider()
            }
        }
        .onAppear {
            viewModel.searchText()
        }
        .onChange(of: searchText) {
            viewModel.searchText()
        }
        .onChange(of: selection) {
            viewModel.searchText()
            searchText = ""
        }
        .listRowInsets(EdgeInsets())
    }
}

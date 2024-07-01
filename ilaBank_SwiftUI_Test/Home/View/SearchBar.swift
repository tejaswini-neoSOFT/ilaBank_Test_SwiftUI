//
//  SearchBar.swift
//  ilaBank_SwiftUI_Test
//
//  Created by Neosoft on 01/07/24.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var isEditing = false
    @Binding var searchText: String
    
    var body: some View {
        VStack {            
            HStack {
                TextField("Search",text: $searchText)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .padding(.leading)
                    .padding([.top, .bottom], 8)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    .padding([.top, .bottom], 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                Button {
                    searchText = ""
                    self.isEditing = false
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(UIColor.tintColor))
                }
            }
            .padding([.leading,.trailing], 10)
            .padding(.top, 3)
            .padding(.bottom, 0)
            .background(.white)
        }
        .listRowInsets(EdgeInsets())
    }
}

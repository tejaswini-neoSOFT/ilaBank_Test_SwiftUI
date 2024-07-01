//
//  BottomButtonView.swift
//  ilaBank_SwiftUI_Test
//
//  Created by Neosoft on 01/07/24.
//

import SwiftUI

struct BottomButtonView: View {
    
    @Binding var showBottomSheet: Bool
    
    var body: some View {
        VStack {
            Button {
                showBottomSheet.toggle()
            } label: {
                Image("icon_Floating")
                    .padding()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
            }
            .clipShape(Circle())
            .padding()
        }
    }
}

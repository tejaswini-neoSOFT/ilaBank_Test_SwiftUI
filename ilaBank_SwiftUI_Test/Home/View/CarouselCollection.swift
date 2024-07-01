//
//  CarouselCollection.swift
//  ilaBank_SwiftUI_Test
//
//  Created by Neosoft on 01/07/24.
//

import SwiftUI

struct CarouselCollection: View {
    
    @Binding var selection: Int
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                ForEach(0..<(viewModel.uiModel.carouselData?.count ?? 0), id: \.self) { index in
                    if let imageName = viewModel.uiModel.carouselData?[index].image {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .tag(index)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .tag(index)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .frame(height: UIScreen.main.bounds.height*0.3)
            .padding([.leading, .trailing], 10)
        }
    }
}

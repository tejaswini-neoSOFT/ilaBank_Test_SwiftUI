//
//  HomeViewModel.swift
//  ilaBank_SwiftUI_Test
//
//  Created by Neosoft on 01/07/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var uiModel: UIModel
    private var fileReader: FileReaderProtocol
    private var charOccurances: [CharacterOccurrenceData]
    
    init(uiModel: UIModel = HomeViewModel.UIModel(),
         requestManager: FileReaderProtocol = FileReader(),
         charOccurances: [CharacterOccurrenceData] = []) {
        self.uiModel = uiModel
        self.fileReader = requestManager
        self.charOccurances = charOccurances
    }
    
    func loadData(){
        do {
            let response: CarouselData = try fileReader.loadDataFrom(file: "Carousel_Data", type: "json")
            uiModel.carouselData = response.data
            uiModel.filteredList = uiModel.carouselData?[uiModel.selection].listData ?? []
        } catch {
        }
    }
    
    func searchText() {
        if uiModel.searchText.isEmpty {
            uiModel.filteredList = uiModel.carouselData?[uiModel.selection].listData ?? []
        } else {
            uiModel.filteredList = uiModel.carouselData?[uiModel.selection].listData.filter { text in
                text.title.localizedCaseInsensitiveContains(uiModel.searchText)
            } ?? []
        }
    }
    
    func topThreeCharacters(in array: [String]) -> [CharacterOccurrenceData] {
        var charCount: [Character: Int] = [:]
        for string in array {
            for char in string {
                charCount[char, default: 0] += 1
            }
        }
        let sortedCharCount = charCount.sorted { $0.value > $1.value }
        let topThree = sortedCharCount.prefix(3).map { CharacterOccurrenceData(character: String($0.key), count: $0.value) }
        return topThree
    }
}

extension HomeViewModel {
    struct UIModel {
        var carouselData : [CarousalDetailData]?
        var filteredList: [ListData] = []
        var searchText: String = ""
        var selection: Int = 0
        var showBottomSheet: Bool = false
    }
}

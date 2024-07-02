//
//  ThemeCollectionItemViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import Foundation

import Domain

enum RatedCategory {
    case mud
    case soil
    case grass
    case flower
    case flowerGarden
    
    init(rated: Double) {
        switch rated {
        case ...2.0:
            self = .mud
        case 2.1...4.0:
            self = .soil
        case 4.1...6.0:
            self = .grass
        case 6.1...8.0:
            self = .flower
        default:
            self = .flowerGarden
        }
    }
}

struct ThemeCollectionItemViewModel {
    let themePosterImagePath: String?
    let isNew: Bool
    let isHeart: Bool
    let title: String
    let branch: String
    let rated: Double
    let category: RatedCategory
}
//
//extension ThemeCollectionItemViewModel: Equatable {
//    static func == (lhs: ThemeCollectionItemViewModel, rhs: ThemeCollectionItemViewModel) -> Bool {
//        lhs.
//    }
//    
//    
//}

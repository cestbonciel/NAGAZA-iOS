//
//  MyPageInfo.swift
//  MyPageInterface
//
//  Created by SeungMin on 6/16/24.
//

import Foundation
import RxDataSources

public typealias MyPageSection = SectionModel<MyPageSectionType, MyPageInfo>

public enum MyPageRowType {
    case myReview
    case like
    case appSetting
    case inquiry
    
    public var title: String {
        switch self {
        case .myReview:
            "내가 작성한 리뷰"
        case .like:
            "찜 목록"
        case .appSetting:
            "앱 설정"
        case .inquiry:
            "문의/제안하기"
        }
    }
}

public enum MyPageSectionType {
    case myData
    case appSetting
    case inquiry
}

public struct MyPageInfo {
    public let type: MyPageRowType
    public var count: Int? = nil
    
    public init(type: MyPageRowType, count: Int? = nil) {
        self.type = type
        self.count = count
    }
}


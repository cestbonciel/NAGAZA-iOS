//
//  Room.swift
//  Nagaza
//
//  Created by SeungMin on 1/3/24.
//

// TODO: 지울 예정
// Default - 방이름    매장명    지점    스토리    장르    제한 시간    주소(위도)    주소(경도)    주소(도로명)    예약 페이지(url)    이미지(url)    전화번호    적정 인원    총점
// Details - 난이도    활동성    인테리어    장치 / 자물쇠    장르 연출 / 스토리    인생 테마    조도(방해)    볼륨(방해)    밀어내기    npc    직렬식/병렬식    노후도    삑딱쿵/분위기    공포도 (공포테마일때만 해당)    기타

import Foundation

public struct Room {
    public let identifier = UUID()
    public let name: String
    public let area: String
    public let story: String
    public let genre: String
    public let timeLimit: Int
    public let address: String
    public let reservationUrlString: String
    public let imageUrlString: String
    public let appropriateNumberOfPeople: Int
    public let total: Double
    
    public init(name: String, area: String, story: String, genre: String, timeLimit: Int, address: String, reservationUrlString: String, imageUrlString: String, appropriateNumberOfPeople: Int, total: Double) {
        self.name = name
        self.area = area
        self.story = story
        self.genre = genre
        self.timeLimit = timeLimit
        self.address = address
        self.reservationUrlString = reservationUrlString
        self.imageUrlString = imageUrlString
        self.appropriateNumberOfPeople = appropriateNumberOfPeople
        self.total = total
    }
}

public struct RoomsPage {
    public let roomsList: [[Room]]
    public let page: Int
    public let totalPages: Int
    
    public init(roomsList: [[Room]], page: Int, totalPages: Int) {
        self.roomsList = roomsList
        self.page = page
        self.totalPages = totalPages
    }
}

extension Room: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: Room, rhs: Room) -> Bool {
        lhs.identifier == rhs.identifier
    }
}

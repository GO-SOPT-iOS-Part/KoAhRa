//
//  Carrot.swift
//  Seminar3
//
//  Created by 고아라 on 2023/04/29.
//

import UIKit

struct Carrot {
    let image : UIImage
    let product : String
    let place : String
    let time : String
    let tradeStatus : Trade
    let price : Int
}

@frozen
enum Trade {
    case reservation
    case completed
    case shared
    case clear
    
    var title : String {
        switch self {
        case .reservation :
            return "예약중"
        case .completed :
            return "거래완료"
        case .shared :
            return "나눔완료"
        case .clear :
            return ""
        }
    }
    
    var backgroundColor : UIColor {
        switch self {
        case .reservation :
            return .systemGreen
        case .completed :
            return .black
        case .shared :
            return .gray
        case .clear :
            return .white
        }
    }
}

extension Carrot {
    
    static func dummy() -> [Carrot] {
        return [Carrot(image: .productImage,
                       product: "에어팟 프로 2",
                       place: "하계 2동",
                       time: "일주일 전",
                       tradeStatus: .completed,
                       price: 200000),
                Carrot(image: .productImage,
                       product:
                        "아이폰 11 Pro",
                       place: "하계 3동",
                       time: "4월 2일",
                       tradeStatus: .reservation,
                       price: 100000),
                Carrot(image: .productImage,
                       product:
                        "에어팟 맥스",
                       place: "공릉 2동",
                       time: "1일 전",
                       tradeStatus: .shared,
                       price: 100000),
                Carrot(image: .productImage,
                       product:
                        "아이패드1",
                       place: "공릉 1동",
                       time: "6시간 전",
                       tradeStatus: .completed,
                       price: 100000),
                Carrot(image: .productImage,
                       product:
                        "아이패드 2",
                       place: "중계 2동",
                       time: "3시간 전",
                       tradeStatus: .clear,
                       price: 100000)
                ,
                Carrot(image: .productImage,
                       product:
                        "안팔아요",
                       place: "중계 2동",
                       time: "4월 3일",
                       tradeStatus: .completed,
                       price: 10000)
                ,
                Carrot(image: .productImage,
                       product:
                        "아이폰 14 Pro",
                       place: "중계 2동",
                       time: "3월 31일",
                       tradeStatus: .reservation,
                       price: 1000)]
    }
}

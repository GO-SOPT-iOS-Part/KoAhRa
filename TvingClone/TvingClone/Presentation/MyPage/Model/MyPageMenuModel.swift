//
//  MyPageMenuModel.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/05.
//


import UIKit

struct MenuUse {
    let useTitle : String
}

extension MenuUse {
    
    static func dummyMenuUse() -> [MenuUse] {
        return [ MenuUse (useTitle: "이용권"),
                 MenuUse (useTitle: "1:1 문의내역"),
                 MenuUse (useTitle: "예약알림"),
                 MenuUse (useTitle: "회원정보 수정"),
                 MenuUse (useTitle: "프로모션 정보 수신 동의")]
    }
}

struct MenuNotice {
    let noticeTitle : String
}

extension MenuNotice {
    
    static func dummyMenuNotice() -> [MenuNotice] {
        return [ MenuNotice (noticeTitle: "공지사항"),
                 MenuNotice (noticeTitle: "이벤트"),
                 MenuNotice (noticeTitle: "고객센터"),
                 MenuNotice (noticeTitle: "티빙 알아보기")]
    }
}


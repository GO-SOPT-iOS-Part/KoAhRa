//
//  SignUpResponse.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/08.
//

struct SignUpResponse: Codable {
    let code: Int
    let success: Bool?
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let userId: Int
    let nickname: String
}

//
//  LoginModel.swift
//  PraxisLogin
//
//  Created by Zanette Ciriaco on 15/12/21.
//

import Foundation

struct SendLogin: Encodable {
    let email: String
    let password: String
    let firebaseToken: String
}

struct LoginResponse: Decodable {
    let code: Int
    let error: String
    let data: String?
}

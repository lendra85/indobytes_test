//
//  User.swift
//  MyApplication
//
//  Created by Sailendra Salsabil on 24/08/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id = UUID()
    let userId: Int?
    let name: String?
    let username: String?
    let email: String?
    let address: Address?
    let phone: String?
    let website: String?
    let company: Company?
    let imageUrl: String? //for dummy only
    var isSearchResult: Bool? = false
    
    private enum CodingKeys: String, CodingKey {
        case userId = "id"
        case name, username, email, address, phone, website, company, imageUrl
    }
}

//
//  Address.swift
//  MyApplication
//
//  Created by Sailendra Salsabil on 24/08/24.
//

import Foundation

struct Address: Codable {

    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: GeoLocation?

}

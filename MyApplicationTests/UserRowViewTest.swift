//
//  UserRowViewTest.swift
//  MyApplicationTests
//
//  Created by Sailendra Salsabil on 25/08/24.
//

import SwiftUI
import XCTest
import ViewInspector
@testable import MyApplication

final class UserRowViewTest: XCTestCase {
    
    func testProductWhenNil() throws {
        let user = User(userId: nil, name: nil, username: nil, email: nil, address: nil, phone: nil, website: nil, company: nil, imageUrl: nil, isSearchResult: nil)
        let rowView = UserRowView(model: user)
        let profileImageView = try rowView.inspect().hStack().find(ProfileImageView.self).actualView()
        let nameText = try rowView.inspect().hStack().vStack(1).text(0)
        
        XCTAssertEqual(profileImageView.imageUrl, "")
        XCTAssertEqual(try nameText.string(), "")
    }
    
    func testProductWhenNotNil() throws {
        let id = 111122
        let imageUrl = "https://example.com"
        let name = "Sailendra"
        let username = "lendra"
        let user = User(userId: id, name: name, username: username, email: nil, address: nil, phone: nil, website: nil, company: nil, imageUrl: imageUrl)
        let rowView = UserRowView(model: user)
        let profileImageView = try rowView.inspect().hStack().find(ProfileImageView.self).actualView()
        let nameText = try rowView.inspect().hStack().vStack(1).text(0)
        let usernameText = try rowView.inspect().hStack().vStack(1).text(1)
        
        XCTAssertEqual(profileImageView.imageUrl, imageUrl)
        XCTAssertEqual(try nameText.string(), name)
        XCTAssertEqual(try usernameText.string(), "@\(username)")
    }
}

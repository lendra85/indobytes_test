//
//  UserListViewTest.swift
//  MyApplicationTests
//
//  Created by Sailendra Salsabil on 26/08/24.
//

import SwiftUI
import XCTest
import ViewInspector
@testable import MyApplication

final class UserListViewTest: XCTestCase {
    
    func testIsLoading() throws {
        let viewModel = UserListViewModel()
        viewModel.isLoading = true
        let view = UserListView(viewModel: viewModel)
        let zstack = try view.inspect().navigationView().find(ViewType.ZStack.self).find(ViewType.VStack.self).find(ViewType.ZStack.self)
        let progressView = try? zstack.find(ViewType.ProgressView.self)
        XCTAssertNotNil(progressView)
    }
    
    func testIsNotLoading() throws {
        let viewModel = UserListViewModel()
        viewModel.isLoading = false
        let view = UserListView(viewModel: viewModel)
        let zstack = try view.inspect().navigationView().find(ViewType.ZStack.self).find(ViewType.VStack.self).find(ViewType.ZStack.self)
        let progressView = try? zstack.find(ViewType.ProgressView.self)
        XCTAssertNil(progressView)
    }
    
    func testListRow() throws {
        let viewModel = UserListViewModel()
        let user = User(userId: nil, name: nil, username: nil, email: nil, address: nil, phone: nil, website: nil, company: nil, imageUrl: nil, isSearchResult: nil)
        viewModel.listRows = [user]
        let view = UserListView(viewModel: viewModel)
        let list = try view.inspect().navigationView().find(ViewType.ZStack.self).find(ViewType.VStack.self).find(ViewType.ZStack.self).list(1).find(UserRowView.self)
        XCTAssertEqual(list.count, 1)
    }
}

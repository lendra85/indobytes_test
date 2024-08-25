//
//  UserListViewModelTest.swift
//  MyApplicationTests
//
//  Created by Sailendra Salsabil on 25/08/24.
//

import XCTest
@testable import MyApplication

final class UserListViewModelTest: XCTestCase {
    
    func testPerformSearchText() {
        let keyword = "Sailendra"
        let viewModel = UserListViewModel()
        let user = User(userId: nil, name: keyword, username: nil, email: nil, address: nil, phone: nil, website: nil, company: nil, imageUrl: nil, isSearchResult: nil)
        viewModel.users = [user]
        viewModel.listRows = [user]
        viewModel.searchText = keyword
        viewModel.performSearch()
        XCTAssertEqual(viewModel.listRows.count, 1)
    }
    
    func testPerformSearchTextNotFound() {
        let viewModel = UserListViewModel()
        let user = User(userId: nil, name: "Sailendra", username: nil, email: nil, address: nil, phone: nil, website: nil, company: nil, imageUrl: nil, isSearchResult: nil)
        viewModel.users = [user]
        viewModel.listRows = [user]
        viewModel.searchText = "Musa"
        viewModel.performSearch()
        XCTAssertEqual(viewModel.listRows.count, 0)
    }
    
    func testPerformResetSearchText() {
        let viewModel = UserListViewModel()
        let user = User(userId: nil, name: "Sailendra", username: nil, email: nil, address: nil, phone: nil, website: nil, company: nil, imageUrl: nil, isSearchResult: nil)
        viewModel.users = [user]
        viewModel.listRows = []
        viewModel.searchText = ""
        viewModel.performSearch()
        XCTAssertEqual(viewModel.listRows.count, 1)
    }
    
    func testFetchData() {
        let viewModel = UserListViewModel()
        let exp = expectation(description: "")
        Task {
            await viewModel.fetchListRows()
            XCTAssertTrue(viewModel.isLoading)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertFalse(viewModel.users.isEmpty)
        XCTAssertFalse(viewModel.listRows.isEmpty)
    }
}

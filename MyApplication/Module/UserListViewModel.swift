//
//  UserListViewModel.swift
//  MyApplication
//
//  Created by Sailendra Salsabil on 24/08/24.
//

import Foundation

class UserListViewModel: ObservableObject {
    var users = [User]()
    @Published var listRows = [User]()
    @Published var isLoading = false
    @Published var searchText: String = ""
    
    @MainActor
    func fetchListRows() async {
        isLoading = true
        NetworkManager.shared.fetchUsers { [weak self] result in
            switch result {
            case .success(let response):
                response?.forEach { [weak self] user in
                    self?.listRows.append(user)
                    self?.users.append(user)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            self?.isLoading = false
        }
    }
    
    func performSearch() {
        if !searchText.isEmpty {
            listRows = listRows.filter {
                $0.name?.lowercased().contains(searchText.lowercased()) == true ||
                $0.username?.lowercased().contains(searchText.lowercased()) == true ||
                $0.email?.lowercased().contains(searchText.lowercased()) == true
            }
            listRows = listRows.map({
                var user = $0
                user.isSearchResult = true
                return user
            })
        } else {
            listRows = users
        }
        objectWillChange.send() 
    }
}

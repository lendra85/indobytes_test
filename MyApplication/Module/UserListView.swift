//
//  UserListView.swift
//  MyApplication
//
//  Created by Sailendra Salsabil on 23/08/24.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    @State private var isSearchResult: Bool = false
    @State private var viewDidLoad = false
    @State private var selectedItem: User? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0xF9F5F2).edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer().frame(height: 10)
                    HStack(spacing: 12) {
                        HStack {
                            TextField("Search", text: $viewModel.searchText)
                                .frame(height: 48)
                                .textFieldStyle(.plain)
                            if !$viewModel.searchText.wrappedValue.isEmpty {
                                IconView(imageResource: .icClose, size: 20) {
                                    $viewModel.searchText.wrappedValue = ""
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        )
                        IconView(imageResource: .icSearch, size: 40, radius: 4, x: 2, y: 3) {
                            isSearchResult = !$viewModel.searchText.wrappedValue.isEmpty
                            viewModel.performSearch()
                        }
                    } 
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    Spacer().frame(height: 20)
                    Text(isSearchResult ? "SEARCH RESULT" : "ALL USERS")
                        .foregroundStyle(.black)
                        .font(.headline)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .border(Color.black)
                    ZStack {
                        if viewModel.isLoading {
                            ProgressView().controlSize(.large)
                        }
                        List(viewModel.listRows, id: \.id) { item in
                            UserRowView(model: item)
                                .listRowInsets(EdgeInsets())
//                                .sheet(isPresented: $isPresented) {
//                                    DetailView(user: item)
//                                }
                                .onTapGesture {
                                    self.selectedItem = item
                                }
                                
//                                .background(
//                                    NavigationLink("", destination: DetailView(user: item).navigationBarHidden(true)).opacity(0)
//                                )
                        }
                        .scrollContentBackground(.hidden)
                        .listRowSpacing(15)
                        .navigationTitle("Users")
                        .navigationBarTitleDisplayMode(.automatic)
                        .fullScreenCover(item: $selectedItem, onDismiss: nil) { item in
                            DetailView(user: item)
                        }
//                        .sheet(isPresented: $isPresented) {
//                            DetailView(user: selectedItem!)
//                        }
                    }
                }
            }
            .task {
                if viewDidLoad == false {
                    await viewModel.fetchListRows()
                    viewDidLoad = true
                }
            }
        }.navigationViewStyle(.stack)
    }
}

#Preview {
    UserListView()
}

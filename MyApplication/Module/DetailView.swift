//
//  DetailView.swift
//  MyApplication
//
//  Created by Sailendra Salsabil on 25/08/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 50)
                Text("Profile")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, minHeight: 50)
                IconView(imageResource: .icClose, size: 25, radius: 5, x: 4, y: 2) {
                    dismiss()
                }.padding(7)
                Spacer()
            }
            .background(.white)
            Divider()
                .frame(minHeight: 1)
                .overlay(Color.black)
            ScrollView {
                VStack {
                    ProfileImageView(imageUrl: user.imageUrl ?? "", size: UIScreen.main.bounds.size.width / 1.5, radius: 25, x: 15, y: 12).padding(.top, 50)
                    Text(user.name ?? "")
                        .font(.title.weight(.bold))
                        .padding(.top, 20)
                    ZStack {
                        VStack {
                            HStack(spacing: 0) {
                                Text("USERNAME")
                                    .font(.subheadline.weight(.bold))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: 110, alignment: .leading)
                                Text(user.username ?? "")
                                    .font(.subheadline.weight(.thin))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 4, trailing: 16))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            HStack(spacing: 0) {
                                Text("EMAIL")
                                    .font(.subheadline.weight(.bold))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: 110, alignment: .leading)
                                Text(user.email ?? "")
                                    .font(.subheadline.weight(.thin))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            HStack(spacing: 0) {
                                Text("ADDRESS")
                                    .font(.subheadline.weight(.bold))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: 110, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                                VStack {
                                    Text(user.address?.street ?? "")
                                        .font(.subheadline.weight(.thin))
                                        .foregroundStyle(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(user.address?.suite ?? "")
                                        .font(.subheadline.weight(.thin))
                                        .foregroundStyle(.black)
                                        .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(user.address?.city ?? "") \(user.address?.zipcode ?? "")")
                                        .font(.subheadline.weight(.thin))
                                        .foregroundStyle(.black)
                                        .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            HStack(spacing: 0) {
                                Text("PHONE")
                                    .font(.subheadline.weight(.bold))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: 110, alignment: .leading)
                                Text(user.phone ?? "")
                                    .font(.subheadline.weight(.thin))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(EdgeInsets(top: 4, leading: 16, bottom: 0, trailing: 16))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            HStack(spacing: 0) {
                                Text("WEBSITE")
                                    .font(.subheadline.weight(.bold))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: 110, alignment: .leading)
                                Text(user.website ?? "")
                                    .font(.subheadline.weight(.thin))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(EdgeInsets(top: 4, leading: 16, bottom: 16, trailing: 16))
                        }
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        )
                        .background(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    
                }.frame(maxWidth: .infinity, alignment: .center)
            }
            .background(Color(hex: 0xF9F5F2))
            .padding(.top, -7)
        }
    }
}

#Preview {
    DetailView(user: User(userId: nil, name: "Sailendra Salsabil", username: "lendra", email: "sailendra.salsabil@gmail.com", address: Address(street: "Victor Plains", suite: "Suite 879", city: "Wisokyburgh", zipcode: "90566-7771", geo: nil), phone: "1-463-123-4447", website: "anastasia.net", company: nil, imageUrl: "https://randomuser.me/api/portraits/thumb/men/98.jpg", isSearchResult: nil))
}

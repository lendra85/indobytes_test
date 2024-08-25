//
//  UserRowView.swift
//  MyApplication
//
//  Created by Sailendra Salsabil on 24/08/24.
//

import SwiftUI

struct UserRowView: View {
    var model: User
    
    init(model: User) {
        self.model = model
    }
    
    init() { //for preview purpose
        model = User(userId: nil, name: "Sailendra Salsabil", username: "sailendra", email: "lendra@gmail.com", address: nil, phone: nil, website: nil, company: nil, imageUrl: "https://randomuser.me/api/portraits/thumb/men/98.jpg", isSearchResult: true)
    }
    
    var body: some View {
        HStack(spacing: 20) {
            ProfileImageView(imageUrl: model.imageUrl ?? "", size: 50, radius: 7, x: 3, y: 2)
            VStack {
                Text(model.name ?? "")
                    .foregroundStyle(.black)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("@\(model.username ?? "")")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            if model.isSearchResult == true {
                IconView(imageResource: .icUserAdd, size: 30, radius: 4, x: 3, y: 1) {}
            }
        }
        .padding()
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
    }
}

#Preview {
    UserRowView()
}

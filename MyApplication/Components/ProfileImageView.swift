//
//  ProfileImageView.swift
//  MyApplication
//
//  Created by Sailendra Salsabil on 24/08/24.
//

import SwiftUI

struct ProfileImageView: View {
    let imageUrl: String
    let size: CGFloat
    var radius: CGFloat = 0
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "photo")
            }
        }
        .frame(width: size, height: size)
        .cornerRadius(size / 2)
        .overlay(
            RoundedRectangle(cornerRadius: (size / 2))
                .stroke(lineWidth: 1)
        )
        .shadow(color: Color(hex: 0xF7D6B4), radius: radius, x: x, y: y)
    }
}

#Preview {
    ProfileImageView(imageUrl: "https://randomuser.me/api/portraits/thumb/men/98.jpg", size: 90, radius: 10, x: 4, y: 2)
}

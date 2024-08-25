//
//  IconView.swift
//  MyApplication
//
//  Created by Sailendra Salsabil on 24/08/24.
//

import SwiftUI

struct IconView: View {
    let imageResource: ImageResource
    var size: CGFloat = 40
    var radius: CGFloat = 0
    var x: CGFloat = 0
    var y: CGFloat = 0
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(imageResource)
                .frame(width: size, height: size)
                .background(Color.white)
                .clipShape(.rect(cornerRadius: (size / 2)))
                .overlay(
                    RoundedRectangle(cornerRadius: (size / 2))
                        .stroke(lineWidth: 1)
                )
                .shadow(color: Color(hex: 0xF7D6B4), radius: radius, x: x, y: y)
        }.buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    IconView(imageResource: .icClose, size: 20) {}
}

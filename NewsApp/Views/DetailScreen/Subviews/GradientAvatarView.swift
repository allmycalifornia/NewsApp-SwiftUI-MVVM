//
//  GradientAvatarView.swift
//  NewsApp
//
//  Created by Борис Кравченко on 27.11.2024.
//

import SwiftUI

struct GradientAvatarView: View {
    var body: some View {
        GeometryReader(
            content: { _ in
                LinearGradient(
                    colors: [Color(UIColor.systemBackground), .clear],
                    startPoint: .bottom,
                    endPoint: .top
                )
                .frame(height: SizeConstants.avatarHeight / 4)
                .offset(y: -SizeConstants.avatarHeight / 4)
        })
    }
}

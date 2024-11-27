//
//  BackButtonView.swift
//  NewsApp
//
//  Created by Борис Кравченко on 27.11.2024.
//

import SwiftUI

struct BackButtonView: View {
    
    // MARK: - Property
    @Environment(\.dismiss) var dismiss
    
    let width: CGFloat = 34
    let circleOpacity: CGFloat = 0.3
    let chevronOpacity: CGFloat = 0.8
    
    // MARK: - Body
    var body: some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .frame(width: width)
                    .foregroundStyle(.black)
                    .opacity(circleOpacity)
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .opacity(chevronOpacity)
            }
        }
    }
}

#Preview {
    BackButtonView()
}

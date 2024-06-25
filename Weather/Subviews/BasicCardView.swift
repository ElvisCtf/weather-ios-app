//
//  BasicCardView.swift
//  Weather
//
//  Created by Elvis Cheng (ESD - Software Trainee, Digital Solutions) on 25/6/2024.
//

import SwiftUI

struct BasicCardView: View {
    let title: String
    let content: String
    let icon: String
    
    var body: some View {
        GroupBox() {
            Text(content)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
                .padding(1)
        } label: {
            Label(title, systemImage: icon)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.white)
                .imageScale(.large)
        }.backgroundStyle(.indigo.opacity(0.3))
    }
}

#Preview {
    BasicCardView(title: "Test card", content: "value", icon: "dot.scope")
}

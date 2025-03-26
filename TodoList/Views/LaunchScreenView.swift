//
//  LaunchScreenView.swift
//  TodoList
//
//  Created by Роман Пшеничников on 06.02.2025.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ListView()
        } else {
            ZStack {
                Color.purple.edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    
                    Text("Doing things")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}

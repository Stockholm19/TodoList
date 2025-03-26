//
//  ListRowView.swift
//  TodoList
//
//  Created by Роман Пшеничников on 02.02.2025.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "First item!", isCompleted: false))
        ListRowView(item: ItemModel(title: "Second Item", isCompleted: true))
        
    }
}

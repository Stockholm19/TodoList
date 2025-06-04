//
//  ListView.swift
//  TodoList
//
//  Created by Роман Пшеничников on 02.02.2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            mainContent
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
    
    // MARK: - Основные представления
    
    private var mainContent: some View {
        Group {
            if listViewModel.items.isEmpty {
                noItemsView
            } else {
                tasksListView
            }
        }
    }
    
    private var noItemsView: some View {
        NoItemsView()
            .transition(.opacity)
            .animation(.easeIn(duration: 0.25), value: listViewModel.items.isEmpty)
    }
    
    private var tasksListView: some View {
        List {
            ForEach(listViewModel.items) { item in
                listRow(for: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
    }
    
    // MARK: - Приватные компоненты UI
    
    private func listRow(for item: ItemModel) -> some View {
        ListRowView(item: item)
            .contentShape(Rectangle())
            .onTapGesture {
                updateItem(item)
            }
    }
    
    // MARK: - Приватные действия
    
    private func updateItem(_ item: ItemModel) {
        withAnimation(.linear) {
            listViewModel.updateItem(item: item)
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}

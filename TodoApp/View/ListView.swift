//
//  ListView.swift
//  TodoApp
//
//  Created by Ravikanth Thummala on 6/6/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel:ListViewModel

    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty{
                EmptyView()
                    .transition(.opacity.animation(.easeIn))
            }else{
                List {
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.easeIn){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItems(from:to:))
                }
            }
        }
        .navigationTitle("Todo List 😆")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add",destination:AddViewItem()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

//
//  ListRowView.swift
//  TodoApp
//
//  Created by Ravikanth Thummala on 6/6/23.
//

import SwiftUI

struct ListRowView: View {
    let item:ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            Text(item.titel)
                .font(.headline)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(Title: "Item 1", IsComplete: false)
    static var item2 = ItemModel(Title: "Item 1", IsComplete: false)

    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }   .previewLayout(.sizeThatFits)

    }
}

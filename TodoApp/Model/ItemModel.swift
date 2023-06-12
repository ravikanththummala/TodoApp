//
//  ItemModel.swift
//  TodoApp
//
//  Created by Ravikanth Thummala on 6/6/23.
//

import Foundation

struct ItemModel: Identifiable, Codable {

    let titel:String
    let isCompleted:Bool
    let id:String
    
    init(Id:String = UUID().uuidString ,Title:String,IsComplete:Bool){
        self.titel = Title
        self.id = Id
        self.isCompleted = IsComplete
    }
    
    func updateCompleted() -> ItemModel{
        return ItemModel(Id: id, Title: titel, IsComplete: !isCompleted)
    }
}

//
//  AddViewItem.swift
//  TodoApp
//
//  Created by Ravikanth Thummala on 6/6/23.
//

import SwiftUI

struct AddViewItem: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    @State var textfieldText :String = ""
    @State var alertTitle :String = ""
    @State var showAler :Bool = false

    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here",text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.621, saturation: 0.048, brightness: 0.916))
                    .cornerRadius(10)
                
                Button {
                    saveButtonTapped()
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)

                }

            }
            .padding(16)
        }.navigationTitle("Add an Item")
            .alert(isPresented: $showAler) {
                getAlert()
            }
    }
    
    func textIsValid() -> Bool{
        if textfieldText.count < 3{
            alertTitle = "You todo item should contain atleast 3 characters😃"
            showAler.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
    func saveButtonTapped(){
        if textIsValid(){
            listViewModel.addItem(title: textfieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddViewItem_Previews: PreviewProvider {
    static var previews: some View {
        AddViewItem()
    }
}

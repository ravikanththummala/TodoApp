//
//  EmptyListView.swift
//  TodoApp
//
//  Created by Ravikanth Thummala on 6/6/23.
//

import SwiftUI

struct EmptyListView: View {
    @State var animate:Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("There is no Items !!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Be more productive and add some todos to finish them on time")
                    .padding(.bottom,20)
               
                NavigationLink {
                    AddViewItem()
                } label: {
                    Text("Add Item  😄")
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("Color"): Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30: 50)
                .shadow(color: animate ? Color("Color").opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30:50,x: 0,y: animate ? 50:30)
                .offset(y:animate ? -7 : 0)

            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation (Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
    
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}

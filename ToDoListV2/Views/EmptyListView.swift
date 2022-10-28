//
//  EmptyListView.swift
//  ToDoListV2
//
//  Created by Leith on 28/10/2022.
//

import SwiftUI

struct EmptyListView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("No tasks yet!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Common you can do it! Feed me with bunch of tasks")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(),
                               label:{
                                    Text("Add a task")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .frame(height: 55)
                                        .frame(maxWidth: .infinity)
                                        .background(animate ? Color.red : Color.accentColor)
                                        .cornerRadius(13)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 25 : 18)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                .easeOut(duration: 2.0)
                .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EmptyListView()
        }
    }
}

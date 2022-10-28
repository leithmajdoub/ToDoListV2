//
//  AddView.swift
//  ToDoListV2
//
//  Created by Leith on 26/10/2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var alertTitle = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("What's your goal", text: $textFieldText)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(13)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Confirm")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(13)
                    
                }
                
            }
            .padding(.horizontal)
            
        }
        .navigationTitle("Add an item ✍️")
        // New alert needs a View in actions
        .alert(alertTitle, isPresented: $showAlert) {
            Text("Minimum of 3 Chars")
        }
    }
        
        func saveButtonPressed() {
            if textIsAppropriate(){
                listViewModel.addItem(title: textFieldText)
                dismiss()
            }
        }
        
        func textIsAppropriate() -> Bool {
            if textFieldText.count < 3 {
                alertTitle = "Min of 3 chars"
                showAlert.toggle()
                return false
            }
            return true
        }
        
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}

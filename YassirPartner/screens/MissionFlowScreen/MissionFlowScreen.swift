//
//  MissionFlowScreen.swift
//  YassirPartner
//
//  Created by macbook  on 4/6/2024.
//

import SwiftUI

struct MissionFlowScreen: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 14) {
                Text("Mission Details")
                    .font(.primaryText, .bold, 20)
                Text("Simple Mission")
                    .font(.primaryText, .bold, 20)
                Text("This is a simple mission with 5 tasks.")
                    .font(.primaryText, .regular, 18)
                ScrollView {
                    TaskItem(task: Taskk(t_name: "Food delivery", t_description: "go to Pizza hot", status: .pending))
                    TaskItem(task: Taskk(t_name: "Percel delivery", t_description: "go to pickup", status: .pending))
                    TaskItem(task: Taskk(t_name: "Percel delivery", t_description: "go to pickup", status: .pending))
                    TaskItem(task: Taskk(t_name: "Percel delivery", t_description: "go to pickup", status: .pending))
                }
              
            }.padding()

        }
    }
    
    @ViewBuilder
    func TaskItem(task: Taskk) -> some View {
        NavigationButton(disabled: false, destination: {
            EmptyView()
        }, label: {
            HStack(alignment: .top) {
                Image(systemName: "checkmark.rectangle.stack.fill")
                    .foregroundColor(.primaryColor)
                    .font(.system(size: 30))
                VStack(alignment: .leading, spacing: 12){
                    Text(task.t_name)
                        .font(.primaryText, .regular, 18)
                    HStack{
                        Image(systemName: "doc.fill")
                            .foregroundColor(.primaryColor)
                            .font(.system(size: 16))
                        Text(task.t_description)
                            .font(.primaryText, .regular, 18)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .font(.system(size: 16))
                            .bold()
                    }
                }
            }
            .padding()
            .overlay(
                   RoundedRectangle(cornerRadius: 16)
                       .stroke(.gray, lineWidth: 1)
                       .shadow(radius: 10)
               )
            .padding(.vertical,8)
        }, action: {
           
        })

      
        
    }
}

#Preview {
    MissionFlowScreen()
}

//
//  CustomizeMenuView.swift
//  CaloryMeter
//
//  Created by naseem on 15/01/2022.
//

import SwiftUI

struct CustomizeMenuView: View {
    let drink: Drink
    
    @State var size = 0
    @State var isDecaf = false
    let sizeOption = ["Small", "Medium", "Large"]
    
    var caffeine: Int {
        100
    }
    
    var calories: Int {
        100
    }
    
    var body: some View {
        Form {
            Section("Basic Options") {
                Picker("Size", selection: $size) {
                    ForEach(sizeOption.indices) { index in
                        Text(sizeOption[index])
                    }
                }
                .pickerStyle(.segmented)
                
                Toggle("Decaffeinated", isOn: $isDecaf )
            }
            
            Section("Estimates") {
                 Text("**Caffeine:** \(caffeine)mg")
                Text("**Calories:** \(calories)")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(drink.name)
    }
}

struct CustomizeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeMenuView(drink: Drink.example)
    }
}

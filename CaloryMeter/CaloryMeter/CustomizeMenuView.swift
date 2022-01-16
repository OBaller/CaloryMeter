//
//  CustomizeMenuView.swift
//  CaloryMeter
//
//  Created by naseem on 15/01/2022.
//

import SwiftUI

struct CustomizeMenuView: View {
    let drink: Drink
    @EnvironmentObject var menu: Menu
    @EnvironmentObject var history: History
    var dismiss: () -> Void
    @State private var size = 0
    @State private var isDecaf = false
    @State private var extraShots = 0
    @State private var milk = ConfigurationOption.none
    @State private var syrup = ConfigurationOption.none
    @State private var isFirstAppearance = true
    
    let sizeOption = ["Small", "Medium", "Large"]
    
    var caffeine: Int {
        var caffeineAmount = drink.caffeine[size]
        caffeineAmount += (extraShots * 60)
        
        if isDecaf {
            caffeineAmount /= 20
        }
        return caffeineAmount
    }
    
    var calories: Int {
        var calorieAmount = drink.baseCalories
        calorieAmount += extraShots * 10
        
        if drink.coffeeBased {
            calorieAmount += milk.calories
        }
        else {
            calorieAmount += milk.calories / 8
        }
        calorieAmount += syrup.calories
        
        return calorieAmount * (size + 1)
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
                
                if drink.coffeeBased {
                    Stepper("Extra Shots: \(extraShots)", value: $extraShots, in: 0...8)
                }
                
                Toggle("Decaffeinated", isOn: $isDecaf )
            }
            
            Section("Customization") {
                Picker("Milk", selection: $milk) {
                    ForEach(menu.milkOptions) { option in
                        Text(option.name)
                            .tag(option)
                    }
                }
                
                if drink.coffeeBased {
                    Picker("Syrup", selection: $syrup) {
                        ForEach(menu.syrupOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
            }
            
            
            Section("Estimates") {
                 Text("**Caffeine:** \(caffeine)mg")
                Text("**Calories:** \(calories)")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(drink.name)
        .toolbar {
            Button("Save") {
                history.add(drink, size: sizeOption[size], extraShots: extraShots, isDecaf: isDecaf, milk: milk, syrup: syrup, caffeine: caffeine, calories: calories)
                dismiss()
            }
        }
        .onAppear {
            guard isFirstAppearance else { return }
            
            if drink.servedWithMilk {
                milk = menu.milkOptions[1]
            }
            isFirstAppearance = false
        }
    }
}

struct CustomizeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeMenuView(drink: Drink.example) { }
            .environmentObject(Menu())
    }
}

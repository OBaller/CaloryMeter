//
//  MenuView.swift
//  CaloryMeter
//
//  Created by naseem on 15/01/2022.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections) { section in
                        Section {
                            ForEach(section.drinks) { drink in
                                VStack {
                                    Image(drink.image)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(10 )
                                    
                                    Text(drink.name)
                                        .font(.system(.body, design: .serif))
                                    
                                }
                                .padding(.bottom)
                            }
                        } header: {
                            Text(section.name)
                                .font(.system(.title, design: .serif))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .background(.background)
                        }
                        
                    }
                }
                .padding(.horizontal )
            }
            .navigationBarTitle("Add Drink")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(Menu())
    }
}

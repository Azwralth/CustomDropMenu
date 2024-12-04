//
//  ContentView.swift
//  CustomDropMenu
//
//  Created by Владислав Соколов on 02.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    @State private var menuItem: DropDownMenuItem = .one
    
    @Environment(\.colorScheme) var scheme
        
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(menuItem.description)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .rotationEffect(.degrees(isTapped ? -180 : 0))
            }
            .frame(height: 40)
            .background(scheme == .dark ? .black : .white)
            .padding(.horizontal)
            .onTapGesture {
                withAnimation(.snappy) {
                    isTapped.toggle()
                }
            }
            
            if isTapped {
                VStack(alignment: .leading) {
                    ForEach(DropDownMenuItem.allCases, id: \.self) { item in
                        HStack {
                            Text(item.description)
                                .foregroundStyle(menuItem == item ? Color.primary : .gray)
                            
                            Spacer()
                            
                            if menuItem == item {
                                Image(systemName: "checkmark")
                                    .font(.subheadline)
                            }
                        }
                        .frame(height: 40)
                        .padding(.horizontal)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                menuItem = item
                                isTapped.toggle()
                            }
                        }
                    }
                }
                .transition(.move(edge: .bottom))
            }
        }
        .background(scheme == .dark ? .black : .white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .primary.opacity(0.2), radius: 4)
        .frame(width: 140)
    }
}

#Preview {
    ContentView()
}


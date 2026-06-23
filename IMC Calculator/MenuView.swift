//
//  MenuView.swift
//  CursoiOS
//
//  Created by Samuel Leal Vega on 23/06/26.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: IMCView()){
                    Text("IMC Calculator")
                }

                Text("App 2")
                Text("App 3")
                Text("App 4")
                Text("App 5")
            }
        }
    }
}

#Preview {
    MenuView()
}

//
//  SuperheroSearcher.swift
//  IMC Calculator
//
//  Created by Samuel Leal Vega on 24/06/26.
//

import SwiftUI

struct SuperheroSearcher: View {
    
    @State var superheroName:String = ""
    
    var body: some View {
        VStack{
            
            TextField("", text: $superheroName, prompt: Text("Ingresar super héroe...").font(.title2).bold().foregroundStyle(.gray))
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(16)
                .border(.purple, width: 2)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    print(superheroName)
                    Task{
                        
                        do{
                            let response = try await ApiNetwork().getHeroesByQuery(query: superheroName)

                            print(response)
                            
                        }catch{
                           print("Error")
                        }
                        
                    }
                }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

#Preview {
    SuperheroSearcher()
}

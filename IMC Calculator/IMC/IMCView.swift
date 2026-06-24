//
//  IMCView.swift
//  CursoiOS
//
//  Created by Samuel Leal Vega on 23/06/26.
//

import SwiftUI

struct IMCView: View {
    
    //    init (){
    //        UINavigationBar.appearance().titleTextAttributes =
    //        [.foregroundColor: UIColor.white]
    //    }
    
    @State var gender: Int = 0
    @State var height: Double = 150
    @State var age: Int = 18
    @State var weight: Int = 70
    
    var body: some View {
        VStack{
            HStack{
                ToggleButton(text: "Samuel", imageName: "figure.stand", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Samuel", imageName: "figure.stand.dress", gender: 1, selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(titleText: "Edad", counterNumber: $age)
                CounterButton(titleText: "Peso", counterNumber: $weight)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator").bold().foregroundColor(.white)
            }
        }
        //        .navigationBarBackButtonHidden()
        //        .navigationTitle("IMC Calculator")
    }
}

struct ToggleButton:View {
    
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        
        let color = if(gender == selectedGender){
            Color.backgroundComponentSelected
        }else {
            Color.backgroundComponent
        }
        
        Button (action: {
            selectedGender = gender
        }){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationText(text: text)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
        }
        
    }
}

struct InformationText: View {
    let text: String
    var body: some View {
        Text(text).font(.title).bold().foregroundColor(.white)
    }
}

struct TitleText: View {
    let text: String
    
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator:View {
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in:100...220, step: 1).accentColor(.purple).padding(.horizontal, 10)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct CounterButton: View {
    let titleText: String
    @Binding var counterNumber: Int
    
    var body: some View {
        VStack{
            TitleText(text: "\(titleText)")
            InformationText(text: String(counterNumber))
            
            HStack{
                Button(action: {
                    if (counterNumber > 0) {
                        counterNumber -= 1
                    }
                }){
                    ZStack{
                        Circle().foregroundColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .padding()
                    }.frame(width: 70, height: 70).padding(.horizontal, 5)
                }
                Button(action: {
                    if (counterNumber < 100) {
                        counterNumber += 1
                    }
                }){
                    ZStack{
                        Circle().foregroundColor(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .padding()
                    }.frame(width: 70, height: 70).padding(.horizontal, 5)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

#Preview {
    IMCView()
}

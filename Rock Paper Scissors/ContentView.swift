//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Balaji Srinivas on 13/02/24.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["🪨", "📄", "✂️"]
    let winingMove = ["📄", "✂️", "🪨"]
    let loosingMove = ["✂️", "🪨", "📄"]
    let alertTitle = "Your Score"
    @State private var alertMessage = ""
    @State private var alertIsShown = false
    @State private var score = 0
    @State private var move = Int.random(in: 0...2)
    @State private var winOrLooseBool = Bool.random()
    @State private var questionNumber = 1
    @State private var questionsLeft = 10
    var winOrLoose: String {
        
        return winOrLooseBool ? "Win" : "Loose"
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.cyan,.blue,.indigo], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack {
                    Text("Rock Paper Scissors")
                        .fontWeight(.regular)
                    Spacer()
                    Text ("Number of questions left: \(questionsLeft)")
                        .font(.headline)
                    Spacer()
                    Text(moves[move])
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                    
                    Text(winOrLoose)
                        .foregroundColor(.black)
                }
                .font(.largeTitle)
                .fontWeight(.bold)
                   
                    VStack {
                        ForEach(0..<3) {number in
                            Button {
                                checkQuestionNumber(number)
                            } label: {
                                Text(winOrLooseBool ? winingMove[number] : loosingMove[number])
                                    .font(.system(size: 70))
                            }
                            .frame(maxWidth: 300, maxHeight: 100)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 20)
                            .padding()
                        }
                    }
                Spacer()
                Spacer()
                    
            }
            .padding()
            .alert(alertTitle, isPresented: $alertIsShown) {
                Button("Start Again") {
                    score = 0
                    questionNumber = 1
                    questionsLeft = 10
                }
            } message: {
                Text("\(score) / 10")
            }
         Spacer()
        }
        
    }
    func checkQuestionNumber(_ number: Int) {
        if questionNumber < 11 {
            buttonPressed(number)
        } else {
            alertIsShown = true
            alertMessage = "\(score)"
        }
    }
    func buttonPressed(_ number: Int) {
        if move == number {
            score += 1
        }
        questionNumber += 1
        questionsLeft -= 1
        print(score)
        winOrLooseBool.toggle()
        move = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}

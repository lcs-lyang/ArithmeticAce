//
//  ContentView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplier = Int.random(in: 1...12)
    //This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var correctProduct: Int {
        return multiplicand * multiplier
    }
    
    var body: some View {
                
        VStack(spacing: 0) {
            
            HStack {
                Text("✕")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(multiplicand)")
                    Text("\(multiplier)")
                }
            }
            
            Divider()
            
            HStack {
                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                        //        CONDITION      true  false
                        .opacity(answerCorrect == true ? 1.0 : 0.0)
                    
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                    //            Condition 1 and  Condition2      true  false
                    //            answerchecked = true   answerCorrect = false
                        .opacity(answerChecked && answerCorrect == false ? 1.0 : 0.0)
                    
                    //you can also do !answerCorrect; ! means to make the variable the opposite
                    
                }
                    Spacer()
                    TextField("",
                              text: $inputGiven)
                        .multilineTextAlignment(.trailing)
                }
            
            
            Button(action: {
                
                // Answer has been checked!
                answerChecked = true
                
                // Convert the input given to an integer, if possible
                guard let productGiven = Int(inputGiven) else {
                    // Sadness, not a number
                    answerCorrect = false
                    return
                }

                // Check the answer!
                if productGiven == correctProduct {
                    // Celebrate! 👍🏼
                    answerCorrect = true
                } else {
                    // Sadness, they gave a number, but it's correct 😭
                    answerCorrect = false
                }
            }, label: {
                Text("Check Answer")
                    .font(.largeTitle)
            })
                .padding()
                .buttonStyle(.bordered)
                .opacity(answerCorrect ? 0.0 : 1.0)
            
            Button(action: {
                //generate a new question
                multiplicand = Int.random(in: 1...12)
                multiplier = Int.random(in: 1...12)
                //reset properties that track what's happening with the current question
                answerCorrect = false
                answerChecked = false
                
                //Reset the input given
                inputGiven = ""

            }, label: {
                Text("New Question")
                    .font(.largeTitle)

            })
                .opacity(answerCorrect ? 1.0 : 0.0)
                .padding()
                .buttonStyle(.bordered)
            
            
            Spacer()
        }
           
        
    .padding(.horizontal)
    .font(.system(size: 72))


        
    }
    
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



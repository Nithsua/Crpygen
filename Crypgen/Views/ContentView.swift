//
//  ContentView.swift
//  Crypgen
//
//  Created by Nivas Muthu M G on 2021-07-24.
//

import SwiftUI

struct ContentView: View {
    @State var passwordGenerated: String;
    @State var specialCharacters = true;
    @State var spaces = true;
    @State var numbers = true;
    @State var characters: Int8 = 16;
    
    init() {
        passwordGenerated = passwordGen(count: 16, includeSpecialCharacters: true, includeNumbers: true, includeSpaces: true)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Password")) {
                        TextField("generated password", text: $passwordGenerated)
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            .disabled(true)
                            .onTapGesture(count: 2) {
                                UIPasteboard.general.string=passwordGenerated
                            }
                    }
                    
                    Section(header: Text("Password length")) {
                        Stepper(value: $characters, in: 8...32, step: 1) {
                            Text("\(characters) Characters")
                        }
                    }
                    
                    Section {
                        Toggle("Include Special Characters", isOn: $specialCharacters)
                        Toggle("Include Spaces", isOn: $spaces)
                        Toggle("Include Numbers", isOn: $numbers)
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            passwordGenerated = passwordGen(count: characters, includeSpecialCharacters: specialCharacters, includeNumbers: numbers, includeSpaces: spaces)
                        }) {
                            Text("Generate")
                                .font(.title)
                                .padding()
                        }
                        Spacer()
                    }
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .foregroundColor(.white)
                    .padding()
                }
            }
            .navigationTitle("Crypgen")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

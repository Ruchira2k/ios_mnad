//
//  ContentView.swift
//  QuadraticSolver
//
//  Created by Ruchira Sahabandu  on 2023-02-24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("a") private var a = 0.0
    @AppStorage("b") private var b = 0.0
    @AppStorage("c") private var c = 0.0
    @State private var x1 = 0.0
    @State private var x2 = 0.0
    @AppStorage("x1") private var x1Val: String  = ""
    @AppStorage("x2") private var x2Val: String = ""
    var body: some View {
        ScrollView {
            VStack {
                Text("Quadratic Solver")
                    .font(.largeTitle)
                    .bold()
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 50, trailing: 0))
                Text("The quadratic form is:")
                    .frame(maxWidth:.infinity)
                Image("quadraticForm")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .padding(.bottom, 20)
                VStack{
                    HStack{
                        Text(Image(systemName: "a.circle.fill")).font(.system(size: 18)).foregroundColor(.black)
                        Text("Enter the Second Term").font(.system(size: 18)).foregroundColor(.black)
                    }
                    TextField("Value of A", value: $a,format:.number)
                    //                    .border(.black)
                        .textFieldStyle(.roundedBorder)
                        .padding([.leading, .trailing])
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                }.padding()
                
                VStack{
                    HStack{
                        Text(Image(systemName: "b.circle.fill")).font(.system(size: 18)).foregroundColor(.black)
                        Text("Enter the First Term").font(.system(size: 18)).foregroundColor(.black)
                    }
                    TextField("Value of B", value: $b,format:.number)
                    //                    .border(.black)
                        .textFieldStyle(.roundedBorder)
                        .padding([.leading, .trailing])
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                }.padding()
                
                VStack{
                    HStack{
                        Text(Image(systemName: "c.circle.fill")).font(.system(size: 18)).foregroundColor(.black)
                        Text("Enter the Third Term").font(.system(size: 18)).foregroundColor(.black)
                    }
                    TextField("Value of C", value: $c,format:.number)
                    //                    .border(.black)
                        .textFieldStyle(.roundedBorder)
                        .padding([.leading, .trailing])
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                }.padding()
                
                Button {
                    solveForX()
                } label: {
                    Text("Solve for X")
                }
                
                HStack{
                    Text("X1 = \(x1Val)").padding()
                    Text("X2 = \(x2Val)").padding()
                }.padding(.top, 50)
            }
        }
        
        
//        NavigationView {
//            VStack {
//                VStack{
//                    Text("The quadratic form is:")
////                                .frame(maxWidth:.infinity)
//                    Image("quadraticForm")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 70)
//                }
//                Form {
//                    Section {
//                        TextField("Amount", value: $a, format:.number)
//                            .keyboardType(.decimalPad)
//                    } header: {
//                        HStack{
//                            Text(Image(systemName: "a.circle.fill")).font(.system(size: 15)).foregroundColor(.black)
//                            Text("Enter the First Term").font(.system(size: 15)).foregroundColor(.black)
//                        }
//                    }
//
//                    Section {
//                        TextField("Amount", value: $b, format:.number)
//                            .keyboardType(.decimalPad)
//                    } header: {
//                        HStack{
//                            Text(Image(systemName: "b.circle.fill")).font(.system(size: 15)).foregroundColor(.black)
//                            Text("Enter the Second Term").font(.system(size: 15)).foregroundColor(.black)
//                        }
//                    }
//
//                    Section {
//                        TextField("Amount", value: $a, format:.number)
//                            .keyboardType(.decimalPad)
//                    } header: {
//                        HStack{
//                            Text(Image(systemName: "c.circle.fill")).font(.system(size: 15)).foregroundColor(.black)
//                            Text("Enter the Third Term").font(.system(size: 15)).foregroundColor(.black)
//                        }
//                    }
//
//                    Button {
//
//                    } label: {
//                        Text("Solve for X").frame(maxWidth: .infinity)
//                    }.buttonStyle(BorderlessButtonStyle())
//                }
//            }
////            .padding()
//                .navigationTitle("Quadratic Solver")
//        }
        
    }
    
    func solveForX() {
        print(sqrt(pow(b,2) - 4 * a * c))
        x1 = (-b + sqrt(pow(b,2) - 4 * a * c))/(2 * a)
        x2 = (-b - sqrt(pow(b,2) - 4 * a * c))/(2 * a)
        
        x1Val = String(format: "%.2f", x1)
        x2Val = String(format: "%.2f", x2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  MainView.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/17.
//

import SwiftUI

struct MainView: View {
    
    @State private var debuggingViewLink: Bool = false
    
    // Title Animation
    @State private var title: String = "< />"
    @State private var index: Int = 0
    @State private var showEarthImage: Bool = false
    @State private var showDebugButton: Bool = false
    let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    
    // InfoView
    @State private var showInfoModal: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    HStack {
                        Button {
                            showInfoModal = true
                        } label: {
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .sheet(isPresented: $showInfoModal) {
                            InfoView()
                        }
                        Spacer()
                    }
                    .opacity(showDebugButton ? 1 : 0)
                    .padding()
                    
                    Spacer()
                    
                    Text(title)
                        .foregroundColor(Color.white)
                        .font(.largeTitle.bold())
                        .onReceive(timer) { output in
                            let fullStr = "EarthDebugger"
                            if index < fullStr.count {
                                let letter = fullStr[fullStr.startIndex...fullStr.index(fullStr.startIndex, offsetBy: index)]
                                self.title = "<\(letter) />"
                                index += 1
                            } else {
                                withAnimation {
                                    showEarthImage = true
                                }
                            }
                        }
                    
                    Spacer()
                    
                    if showEarthImage {
                        Image("earth")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 560, maxHeight: 560)
                            .padding()
                            .transition(.opacity.animation(.easeOut(duration: 1)))
                            .onAppear {
                                withAnimation(.easeOut(duration: 1).delay(1)) {
                                    showDebugButton = true
                                }
                            }
                    } else {
                        Image("earth")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 560, maxHeight: 560)
                            .padding()
                            .opacity(0)
                    }
                    
                    Spacer()
                    
                    Button {
                        // TODO: Action
                        debuggingViewLink = true
                    } label: {
                        HStack(spacing: 24) {
                            Image(systemName: "ant.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("DEBUG")
                                .font(.title)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .opacity(showDebugButton ? 1 : 0)
                    
                    // MARK: - Debugging View
                    NavigationLink("", destination: DebuggingView(), isActive: $debuggingViewLink)
                    
                    Spacer()
                    
                }
                
                GeometryReader { proxy in
                    RadialGradient(colors: [Color.clear, Color.indigo], center: .top, startRadius: proxy.size.height / 4, endRadius: 0)
                        .opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    RadialGradient(colors: [Color.clear, Color.cyan], center: .bottom, startRadius: proxy.size.height / 4, endRadius: 0)
                        .opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            
        }
        .navigationViewStyle(.stack)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 14 Pro")
    }
}

//
//  ContentView.swift
//  iOSLockScreen
//
//  Created by Mike Gopsill on 20/07/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var locked = true
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: geo.size.width)

                Color.black.opacity(0.15)
                
                
                VStack(spacing: 0) {
                    Image(systemName: locked ? "lock.fill" : "lock.open.fill")
                        .font(.largeTitle)
                        .padding(.top, 60)
                        .onTapGesture {
                            withAnimation {
                                locked.toggle()
                            }
                        }

                    Text(Date(), style: .time)
                        .font(.system(size: 92, weight: .thin))

                    Text(Date(), style: .date)
                        .font(.title2)
                        .padding(.top, -10)

                    Spacer()

                    HStack {
                        LockScreenButton(image: "flashlight.off.fill") {
                            print("flash light tapped")
                        }
                        Spacer()
                        LockScreenButton(image: "camera.fill") {
                            print("camera tapped")
                        }
                    }
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 150, height: 5)
                        .padding(.bottom, 10)
                }
                .padding([.leading, .trailing])
                .foregroundColor(.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LockScreenButton: View {
    @State private var pressed = false
    @State private var activated = false

    let image: String
    let action: (() -> Void)?
    
    var body: some View {
        Image(systemName: image)
            .font(.title3)
            .frame(width: 50, height: 50)
            .background(activated ? Color.white : Color.black.opacity(pressed ? 0.8 : 0.4))
            .foregroundColor(activated ? .black : .white)
            .clipShape(Circle())
            .scaleEffect(pressed ? 1.5 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.7))
            .onLongPressGesture(minimumDuration: 0.4) { bool in
                pressed = bool
            } perform: {
                let generator = UIImpactFeedbackGenerator()
                generator.impactOccurred()
                activated.toggle()
                pressed = false
                action?()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

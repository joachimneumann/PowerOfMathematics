//
//  MainView.swift
//  Fitch Cheney
//
//  Created by Joachim Neumann on 15/04/2021.
//

import SwiftUI

struct Number: View {
    @State var viewModel: ViewModel
    let w: CGFloat = 0.23
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    VStack {
                        Text("2")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .opacity(viewModel.hasBeenSelected(.N2) ? 0 : 1)
                    .onTapGesture {
                        viewModel.setNumber(.N2)
                    }
                    VStack {
                        Text("3")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .opacity(viewModel.hasBeenSelected(.N3) ? 0 : 1)
                    .onTapGesture {
                        viewModel.setNumber(.N3)
                    }
                    VStack {
                        Text("4")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.N4)
                    }
                    VStack {
                        Text("5")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.N5)
                    }
                }
                HStack {
                    VStack {
                        Text("6")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.N6)
                    }
                    VStack {
                        Text("7")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.N7)
                    }
                    VStack {
                        Text("8")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.N8)
                    }
                    VStack {
                        Text("9")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.N9)
                    }
                }
                HStack {
                    VStack {
                        Text("10")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.N10)
                    }
                    VStack {
                        Text("J")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.NJ)
                    }
                    VStack {
                        Text("Q")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.NQ)
                    }
                    VStack {
                        Text("K")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.NK)
                    }
                }
                HStack {
                    VStack {
                        Text("A")
                            .foregroundColor(viewModel.color())
                            .font(viewModel.font)
                            .padding(.bottom, viewModel.bottomPaddingNumbers)
                            .zIndex(1)
                        Image(viewModel.currentSuitName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * w)
                    }
                    .onTapGesture {
                        viewModel.setNumber(.NA)
                    }
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct Suit: View {
    @State var viewModel: ViewModel
    var body: some View {
        VStack {
            Text("Card \(viewModel.currentCounter)")
                .font(viewModel.font)
                .padding(.bottom, 50)
            HStack {
                Image("diamonds")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .onTapGesture {
                        viewModel.setSuit(.diamonds)
                    }
                Image("hearts")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .onTapGesture {
                        viewModel.setSuit(.hearts)
                    }
            }
            HStack {
                Image("spades")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .onTapGesture {
                        viewModel.setSuit(.spades)
                    }
                Image("clubs")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .onTapGesture {
                        viewModel.setSuit(.clubs)
                    }
            }
        }
        .padding()
    }
}

struct Solution: View {
    @State var viewModel: ViewModel
    @State var flipped = false
    @State var turn90 = false
    let duration90 = 0.3
    var body: some View {
        Image(self.flipped ? viewModel.solution! : "back")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0)) // mirror effect to compenate for 3D rotation
            .rotation3DEffect(self.turn90 ? (flipped ? Angle(degrees: 180) : Angle(degrees: 90)) : Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
            .onShake {
                if !self.turn90 {
                    withAnimation(.linear(duration: duration90)) {
                        self.turn90.toggle()
                    }
                }
                if !self.flipped {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration90) {
                        withAnimation(.linear(duration: duration90)) {
                            self.flipped.toggle()
                        }
                    }
                }
            }
            .onTapGesture {
                if self.flipped {
                    viewModel.reset()
                }
            }
    }
}
//            .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))


struct MainView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        if viewModel.solution != nil {
            Solution(viewModel: viewModel)
        } else {
            if viewModel.currentSuit() == .none {
                Suit(viewModel: viewModel)
            } else {
                Number(viewModel: viewModel)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel:ViewModel())
    }
}


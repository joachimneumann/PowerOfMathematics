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
                    let numbers: [Model.Number] = [.N2, .N3, .N4, .N5]
                    ForEach(numbers, id: \.self) { n in
                        VStack {
                            Text(n.shortName)
                                .foregroundColor(viewModel.color())
                                .font(viewModel.font)
                                .padding(.bottom, viewModel.bottomPaddingNumbers)
                                .zIndex(1)
                            Image(viewModel.currentSuitName())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * w)
                        }
                        .opacity(viewModel.hasBeenSelected(n) ? 0.2 : 1)
                        .onTapGesture {
                            if !viewModel.hasBeenSelected(n) { viewModel.setNumber(n) }
                        }
                    }
                }
                HStack {
                    let numbers: [Model.Number] = [.N6, .N7, .N8, .N9]
                    ForEach(numbers, id: \.self) { n in
                        VStack {
                            Text(n.shortName)
                                .foregroundColor(viewModel.color())
                                .font(viewModel.font)
                                .padding(.bottom, viewModel.bottomPaddingNumbers)
                                .zIndex(1)
                            Image(viewModel.currentSuitName())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * w)
                        }
                        .opacity(viewModel.hasBeenSelected(n) ? 0.2 : 1)
                        .onTapGesture {
                            if !viewModel.hasBeenSelected(n) { viewModel.setNumber(n) }
                        }
                    }
                }
                HStack {
                    let numbers: [Model.Number] = [.N10, .NJ, .NQ, .NK]
                    ForEach(numbers, id: \.self) { n in
                        VStack {
                            Text(n.shortName)
                                .foregroundColor(viewModel.color())
                                .font(viewModel.font)
                                .padding(.bottom, viewModel.bottomPaddingNumbers)
                                .zIndex(1)
                            Image(viewModel.currentSuitName())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * w)
                        }
                        .opacity(viewModel.hasBeenSelected(n) ? 0.2 : 1)
                        .onTapGesture {
                            if !viewModel.hasBeenSelected(n) { viewModel.setNumber(n) }
                        }
                    }
                }
                HStack {
                    let numbers: [Model.Number] = [.NA]
                    ForEach(numbers, id: \.self) { n in
                        VStack {
                            Text(n.shortName)
                                .foregroundColor(viewModel.color())
                                .font(viewModel.font)
                                .padding(.bottom, viewModel.bottomPaddingNumbers)
                                .zIndex(1)
                            Image(viewModel.currentSuitName())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * w)
                        }
                        .opacity(viewModel.hasBeenSelected(n) ? 0.2 : 1)
                        .onTapGesture {
                            if !viewModel.hasBeenSelected(n) { viewModel.setNumber(n) }
                        }
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


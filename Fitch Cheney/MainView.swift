//
//  MainView.swift
//  Fitch Cheney
//
//  Created by Joachim Neumann on 15/04/2021.
//

import SwiftUI

struct Number: View {
    @ObservedObject var viewModel: ViewModel
    let numberSuit: Model.Suit
    let w: CGFloat = 0.23
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                let numberMatrix: [[Model.Number]] = [[.N2, .N3, .N4, .N5], [.N6, .N7, .N8, .N9], [.N10, .NJ, .NQ, .NK], [.NA]]
                ForEach(numberMatrix, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { n in
                            VStack {
                                Text(n.shortName)
                                    .foregroundColor(viewModel.color())
                                    .font(viewModel.font)
                                    .padding(.bottom, viewModel.bottomPaddingNumbers)
                                    .zIndex(1)
                                Image(numberSuit.name)
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
                }
                Spacer()
            }
            .onShake {
                viewModel.reset()
            }
        }
        .padding()
    }
}

struct Suit: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack {
            Text("\(viewModel.localisedCard) \(viewModel.numberOfCards + 1)")
                .font(viewModel.font)
                .padding(.bottom, 50)
            let suitMatrix: [[Model.Suit]] = [[.diamonds, .hearts], [.spades, .clubs]]
            ForEach(suitMatrix, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { s in
                        Image(s.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(20)
                            .onTapGesture {
                                viewModel.setSuit(s)
                            }
                    }
                }
            }
        }
        .padding()
    }
}

struct Solution: View {
    @ObservedObject var viewModel: ViewModel
    @State var flipped = false
    @State var turn90 = false
    let duration90 = 0.3
    var body: some View {
        Image((viewModel.solution != nil && self.flipped) ? viewModel.solution! : "back")
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


struct MainView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        if viewModel.solution != nil {
            Solution(viewModel: viewModel)
        } else {
            if let s = viewModel.selectedSuit {
                Number(viewModel: viewModel, numberSuit: s)
            } else {
                Suit(viewModel: viewModel)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel:ViewModel())
    }
}


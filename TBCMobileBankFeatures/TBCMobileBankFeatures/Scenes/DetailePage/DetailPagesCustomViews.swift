//
//  DetailPagesCustomViews.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 23.02.25.
//

import SwiftUI

struct AddSubscriptionButtonStyle: View {
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.gray)
                Image(systemName: "dollarsign.arrow.circlepath")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 25, height: 25)
            }
            
            Text("დამატება")
                .font(.system(size: 14))
                .foregroundColor(.primary)
                .cornerRadius(10)
        }
    }
}

struct DummyButtonStyle: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.gray)
                
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 25, height: 25)
            }
            
            Text("უფუნქციო")
                .font(.system(size: 14))
                .foregroundColor(.primary)
        }
        .opacity(0.3)
    }
}

struct ReceiverView: View {
    var title: String
    var body: some View {
        Text(title)
            .padding()
            .bold()
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding([.leading])
                Spacer()
                Text("მიმღების აღწერა")
                    .font(.system(size: 14, weight: .bold))
                    .padding([.trailing])
            }
            
            HStack {
                Text("ანგარიშის ნომერი")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding([.top, .leading])
                
                Spacer()
                
                Text("GE66TB0002511340000000")
                    .font(.system(size: 14, weight: .bold))
                    .padding([.trailing])
            }
            
            HStack {
                Text("ბანკის სახელი")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding([.top, .leading])
                
                Spacer()
                
                Text("სს თიბისი ბანკი")
                    .font(.system(size: 14, weight: .bold))
                    .padding([.trailing])
            }
            
            HStack {
                Text("ბანკის კოდი")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding([.top, .leading])
                
                Spacer()
                
                Text("TBCBGE22")
                    .font(.system(size: 14, weight: .bold))
                    .padding([.trailing])
            }
        }
    }
}

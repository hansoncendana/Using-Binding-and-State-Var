//
//  Ticket.swift
//  Binding
//
//  Created by User10 on 22/11/22.
//

import SwiftUI

struct Ticket: View {
    @Binding var idx : Int
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("Ticket\(idx)")
                    .resizable().padding().scaledToFit().frame(width: geometry.size.width, height: 300).clipped()
            }
        }
    }
}


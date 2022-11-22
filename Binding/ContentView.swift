//
//  ContentView.swift
//  Binding
//
//  Created by User10 on 22/11/22.
//

import SwiftUI


struct ContentView: View {
    var ConcertType = ["Online Concert", "Onsite Concert"]
    let Cover = ["CyberAngel","StarFall", "HonkaiDiva","MoonHalo","Regression", "TruE"]
    @State private var selectedType = 0
    @State private var selectedIdx = 0
    @State private var name = ""
    @State private var email = ""
    @State private var selectedDate = Date()
    let dateRange: ClosedRange<Date> = {
        let calender = Calendar.current
        let startComponents = DateComponents(year:2022, month:8, day:22)
        let endComponents = DateComponents(year:2022, month:8, day:25)
        return calender.date(from:startComponents)!
        ...
        calender.date(from:endComponents)!
    }()
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack() {
                    Text("Concert Ticket Maker")
                        .font(.title)
                    Image("\(self.Cover[selectedIdx])").resizable().padding().scaledToFill().frame(width: geometry.size.width, height: 300).clipped()
                    Form {
                        HStack {
                            Picker("Select Cover", selection: self.$selectedIdx) {
                                ForEach(0..<Cover.count) { idx in
                                    Text(self.Cover[idx])
                                }
                            }.foregroundColor(.black)
                        }
                        VStack {
                            Picker(selection: $selectedType, label:Text("Select")) {
                                ForEach(ConcertType.indices) { idx in
                                    Text(ConcertType[idx])
                                }
                                .foregroundColor(.black)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        HStack {
                            DatePicker("Concert Date:", selection: $selectedDate, in: dateRange, displayedComponents: .date)
                        }
                        HStack {
                            Text("Name:")
                            TextField("", text:$name)
                        }
                        HStack {
                            Text("Email:")
                            TextField("", text:$email)
                        }
                    }
                    NavigationLink(destination:Ticket(idx:$selectedIdx),label: {
                        Text("Create Ticket")
                    })	
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

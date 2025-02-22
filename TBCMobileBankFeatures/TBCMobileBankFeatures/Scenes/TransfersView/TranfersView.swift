//
//  TransfersView.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 21.02.25.
//

import SwiftUI

struct TransfersView: View {
    let items: [Item] = sampleItems
    @State private var searchText = ""
    @State private var isRefreshing = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Dictionary(grouping: items.filter { item in
                    searchText.isEmpty || item.title.lowercased().contains(searchText.lowercased())
                }, by: { Calendar.current.startOfDay(for: $0.date) }).keys.sorted(), id: \.self) { date in
                    Section(header: Text(date, style: .date)) {
                        ForEach(items.filter { Calendar.current.isDate($0.date, inSameDayAs: date) && (searchText.isEmpty || $0.title.lowercased().contains(searchText.lowercased())) }) { item in
                            NavigationLink(destination: DetailView(item: item)) {
                                TransferRowView(item: item)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .background(Color("backgroundColor"))
            .navigationTitle("ტრანზაქციები")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("This button is for just visual!")
                    }) {
                        Image("burgerMenuIcon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.primary)
                    }
                }
            }
            .refreshable {
                await refreshData()
            }
        }
    }
    
    func refreshData() async {
        isRefreshing = true
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
        } catch {
            print("Error during sleep: \(error)")
        }
        isRefreshing = false
    }
    
}

#Preview {
    TransfersView()
}

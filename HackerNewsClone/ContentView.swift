//
//  ContentView.swift
//  HackerNewsClone
//
//  Created by ramil on 15.09.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var manager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(manager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.title)
                                .bold()
                            Text(post.url ?? "")
                                .foregroundColor(.secondary)
                        }
                    })
            }.navigationTitle("Hacker News Clone")
        }.onAppear() {
            manager.getNews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

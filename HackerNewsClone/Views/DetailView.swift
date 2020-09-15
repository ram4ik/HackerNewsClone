//
//  DetailView.swift
//  HackerNewsClone
//
//  Created by ramil on 15.09.2020.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://apple.com")
    }
}

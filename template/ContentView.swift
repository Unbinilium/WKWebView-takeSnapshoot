//
//  ContentView.swift
//  template
//
//  Created by Unbinilium on 3/8/21.
//

import Foundation
import SwiftUI
import WebKit

struct myWebView: UIViewRepresentable {
    var url: String
    var view = WKWebView()

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        let request = URLRequest(url: url)
        view.load(request)
        return view
    }
    
    func takeSnapshoot() -> Void {
        view.takeSnapshot(with: nil) { image, error in
            if let image = image {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<myWebView>) {}
}

struct ContentView: View {
    let view = myWebView(url: "https://blog.unbinilium.me")
    
    var body: some View {
        VStack() {
            view
                .ignoresSafeArea()
            
            Button("Save to Photos") {
                view.takeSnapshoot()
            }
                .padding()
                .background(Color.black)
                .cornerRadius(30)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


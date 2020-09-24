//
//  WebView.swift
//  HackerNews
//
//  Created by Zoltan Zavarko on 24/9/20.
//

import Foundation
import WebKit
import SwiftUI




// creating a webview - ther eis no such think out of box, we need to create it for UIKIT
struct WebView: UIViewRepresentable{
    
    
    let urlString:String?
    
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
                
                
            }
            
        }
        
    }
}

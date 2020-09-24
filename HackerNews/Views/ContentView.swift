//
//  ContentView.swift
//  HackerNews
//
//  Created by Zoltan Zavarko on 23/9/20.
//

import SwiftUI

struct ContentView: View {
    //to listen to the broadcatsed data from NetworkManager we have to create an instance here, to do that we have to mark it @ObservedObject
    @ObservedObject var networkManager = NetworkManager()
    
    
    
    var body: some View {
        NavigationView{
            // populating the List from the array
            List(networkManager.posts){ post in
                NavigationLink(
                    destination: DetailView(url: post.url)){
                    
                        HStack {
                            Text("\(post.points)")
                            Text(post.title)
                        }
                    
                }
                
        
            }
            .navigationTitle("Hacker News")
        }
        
        // onAppear function is the same as viwDidLoad
        .onAppear{
            self.networkManager.fetchData()
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



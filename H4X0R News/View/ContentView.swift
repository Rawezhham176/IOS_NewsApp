import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
//    init() {
//            UITableView.appearance().backgroundColor = .green // Uses UIColor
//        }
    
    var body: some View {
        NavigationView {
            ZStack {
                List(networkManager.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        VStack {
                            Text(String(post.name)).bold()
                            Divider()
                            Text(post.description).multilineTextAlignment(.center)
                        }
                    }
                }
            .navigationBarTitle("My News")
        }
        }
        .onAppear {
            networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Hola"),
//    Post(id: "3", title: "Bonjour")
//]

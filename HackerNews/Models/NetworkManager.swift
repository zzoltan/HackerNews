
// this is the class for parsing the JSON file
// this class will implement the ObservableObject protocol, this is the protocol which allows the class to broadcast uts properties
import Foundation
class NetworkManager: ObservableObject{
// to publish the posts array we have to mark it @Published
   @Published var posts = [Post]()
    
    func fetchData(){
        if let url  = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safedata = data{
                        do{
                            let reults = try decoder.decode(Results.self, from: safedata)
                            DispatchQueue.main.async {
                                self.posts = reults.hits
                            }
                            
                            
                        }catch{
                            print(error)
                    }
                    }
                    
                }
            }
            task.resume()
        }
    }
}

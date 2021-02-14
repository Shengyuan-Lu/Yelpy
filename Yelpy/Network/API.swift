import Foundation


struct API {
    
    
    static func getRestaurants(completion: @escaping ([Restaurant]?) -> Void) {
        
        // Add your own API key!
        let apikey = "ehPfk-z6ZLoBX14bJDzeFuEckpAO36VfK_t_Sz8UO8H03WU4OJYF22iJzvTy8VPAidPy59q3uN6aytcvimZK9yHXBbAxPGL0n2-_TYJVyytYLtFM54pYy5Mr4_30X3Yx"
        
        // Coordinates for UC Irvine
        let lat = 33.6405
        let long = -117.8443
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
                // Get data from API and return it using completion
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let restDictionaries = dataDictionary["businesses"] as! [[String: Any]]
                
                let restaurants = restDictionaries.map({ Restaurant.init(dict: $0) })
                
                
                return completion(restaurants)
                
            }
        }
        
        task.resume()
        
    }
}



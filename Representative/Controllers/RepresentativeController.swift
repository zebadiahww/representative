//
//  RepresentativeController.swift
//  Representative
//
//  Created by Zebadiah Watson on 10/2/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import Foundation

class RepresentativeController {
    //create URL
    private static let baseURL = URL(string: "https://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentative(forState state: String, completion: @ escaping ([Representative]) -> Void) {
        // get the URL
        guard let url = self.baseURL else {completion([]); fatalError("URL is nil")}
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let repQueryItem = URLQueryItem(name: "state", value: "\(state)")
        let outputQueryItem = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [repQueryItem, outputQueryItem]
        guard let finalURL = components?.url else { completion([]); return }
        print(finalURL)
        
        // Start dataTask
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error { print("Error decoding data! \(error.localizedDescription)")}
            guard let data = data else { return }
            let asciiData = String(data: data, encoding: .ascii)
            guard let newData = asciiData?.data(using: .utf8) else {completion([]); return }
            let jsonDecoder = JSONDecoder()
            do {
                let resultsDictionary = try jsonDecoder.decode([String: [Representative]].self, from: newData)
                guard let repArray = resultsDictionary["results"] else { completion([]); return }
                completion(repArray)
            } catch {
                print("error decoding data! \(error.localizedDescription) \n \(error)")
            }
        }
        dataTask.resume()
    }
}// End of Class

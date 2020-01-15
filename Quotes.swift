//
//  Quotes.swift
//  QuotesApp3
//
//  Created by Stanislav Starzhynskyi on 11/01/2020.
//  Copyright © 2020 Stanislav Starzhynskyi. All rights reserved.
//

import Foundation

struct Quote: Decodable {
    let qoute: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case quote
        case author
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.qoute = try valueContainer.decode(String.self, forKey: .quote)
        self.author = try valueContainer.decode(String.self, forKey: .author)
        
}
}

func getQuote(completion: @escaping (_ quotes: [Quote]) -> Void) {

let url = URL(string: "https://breaking-bad-quotes.herokuapp.com/v1/quotes")!
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data,
    
            let quoteDictionary = try? jsonDecoder.decode([Quote].self, from: data) {
            completion(quoteDictionary)
            print(quoteDictionary)
            
        }
        
    } )
    
   task.resume()
}





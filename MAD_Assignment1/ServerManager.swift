//
//  ServerManager.swift
//  MAD_Assignment1
//
//  Created by Pranalee Jadhav on 8/28/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}


func post_request(url: String, parameters: Parameters) -> Int {
   
    var result: Int = 0
    
    if Connectivity.isConnectedToInternet {
        print("Yes! internet is available.")
        // do some tasks..
    
        
        let server_url = "https://myurl.com/posts" + url
        
        Alamofire.request(server_url,method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print("response : \(String(describing: response.result.value))")
                }
                result = 2
                break
                
            case .failure(_):
                print("Failure : \(String(describing: response.result.error))")
                result = 1
                break
                
            }
        }


        
}
    return result
}



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
    
        
       
       
      /*  let headers = ["Content-Type": "application/x-www-form-urlencoded"]
        let completeURL = "http://the_complete_url_here"
        Alamofire.request(server_url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>)  in
            print("ghjgj")
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)") // your JSONResponse result
                //completionHandler(JSON as! NSDictionary)
            }
            else {
                print(response.result.error!)
            }
        }
        */
         let server_url = "http://laravel-jwt.us-east-2.elasticbeanstalk.com/api/" + url
         Alamofire.request(server_url, method: .post, parameters: parameters,encoding:
         JSONEncoding.default, headers: nil).responseJSON {
         response in
         switch response.result {
         case .success:
         print(response)
         break
         
         case .failure(let error):
         print(error)
         }
         }
        /*
        Alamofire.request(server_url,method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response:DataResponse<Any>) in
            print(response.result)
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
*/

        
}
    return result
}



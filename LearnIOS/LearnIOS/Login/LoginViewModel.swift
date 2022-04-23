//
//  LoginViewModel.swift
//  LearnIOS
//
//  Created by Senthil Narayanan on 27/03/22.
//

import Foundation
import SwiftUI


@MainActor
class LoginViewModel :ObservableObject{

    @Published var userDetail = UserDetail()
    @Published var showLoadingIndicator = false
    
    public func DoLogin() -> Bool
    {
        
        let url = URL(string: "https://reqres.in/api/login")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        
        
        let encodedData = try? JSONEncoder().encode(userDetail)

//        let jsonString = String(data: encodedData, encoding: .utf8)
        
        request.httpBody = encodedData

  
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {                                              // check for fundamental networking error
                print("error", error ?? "Unknown error")
                return
            }

            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }

            
//            var auth:AuthToken = try decoder.decode(AuthToken.self, from: data)
//            auth.token
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = /auth.token")
            if let dataFromJsonString = responseString?.data(using: .utf8) {
                let cityFromData = try JSONDecoder().decode(AuthToken.self,
                                                            from: dataFromJsonString)
                
                print(cityFromData.token)
            }
            
        } throws {
            
        }

        task.resume()
        
        
        return true;
    }
}

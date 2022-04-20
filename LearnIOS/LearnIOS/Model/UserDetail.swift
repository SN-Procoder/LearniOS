//
//  UserDetail.swift
//  LearnIOS
//
//  Created by Senthil Narayanan on 27/03/22.
//

import Foundation

class UserDetail: Codable{
    
    var email:String = ""
    var password:String = ""
    init(){
        
    }
    func isValidUser()-> Bool{
        
        if(email=="Admin" && password == "Admin") {
            return true
            
        }
        return false
    }
}

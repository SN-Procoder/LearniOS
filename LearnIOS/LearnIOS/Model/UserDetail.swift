//
//  UserDetail.swift
//  LearnIOS
//
//  Created by Senthil Narayanan on 27/03/22.
//

import Foundation

class UserDetail: Codable{
    
    var email:String = "eve.holt@reqres.in"
    var password:String = "cityslicka"
    init(){
        
    }
    func isValidUser()-> Bool{
        
        
        return true;
    }
}

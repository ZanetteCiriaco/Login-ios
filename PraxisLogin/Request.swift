//
//  Request.swift
//  PraxisLogin
//
//  Created by Zanette Ciriaco on 15/12/21.
//

import Foundation

struct Request {
    
    func post(_ sendLogin: SendLogin, completion: @escaping () -> Void) {
        print(sendLogin)
        guard let url = URL(string: "http://192.168.24.207:8082/api/v1/auth/signin") else { return }
        var request = URLRequest(url: url)
        
        do {
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody =  try JSONEncoder().encode(sendLogin)
            
            
            let _ = URLSession.shared.dataTask(with: request) { data, response, error in
                if error == nil {
                    guard let data = data else { return }
                    
                    do {
                        let apiResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                        DispatchQueue.main.async {
                            print(apiResponse)
                            completion()
                        }
                        
                    } catch  {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
            
        } catch  {
            print("erro ao converter")
        }
    }
}



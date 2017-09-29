//
//  Network.swift
//  API
//
//  Created by Pavlo Boiko on 25.05.17.
//  Copyright © 2017 Impl. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

public struct Network{
    
    static let publicSession: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = true
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let session = Alamofire.SessionManager(configuration: configuration)
        return session
    }()
    
    public func request<T:Codable,E:URLRequestConvertible>(_ endpoint:E,
                                                           responce: @escaping (_ object:T) -> Void,
                                                           failure: @escaping (_ error:Error) -> Void) {
         Network.publicSession.request(endpoint).responseData  {  result in
            SVProgressHUD.dismiss()
            do {
                if let error = result.error {
                    failure(error)
                    return
                }
                guard let data = result.data else { return }
                responce(try JSONDecoder().decode(T.self, from: data))
            } catch {
                fatalError("API cnahged")
            }
        }
    }
    
}



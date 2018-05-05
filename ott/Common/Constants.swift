import Foundation

// MARK: - Constants
struct Constants {
    struct API {
        
        // MARK: Base URL
        static let baseURL = URL(string: "http://penquistas.cl/ott/")!
        
        // MARK: User token
        private static let defaultUserToken: String = "4a990dba85ff2bb7bdc67eec7fda96f0d73ba3466fb6f3aaec46ba3a3ef0d257"
        private static let _userTokenKey = "user_token"
        
        static var userToken: String {
            get {
                guard let token = UserDefaults.standard.string(forKey: _userTokenKey) else {
                    return Constants.API.defaultUserToken
                }
                
                return token
            }
            
            set {
                UserDefaults.standard.set(newValue, forKey: _userTokenKey)
            }
        }
        
    }
}


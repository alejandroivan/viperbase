struct Image: Codable {
    let small: String?
    let medium: String?
    let normal: String?
    
    var smallestNonNull: String? {
        get {
            return small ?? medium ?? normal
        }
    }
    
    var biggestNonNull: String? {
        get {
            return normal ?? medium ?? small
        }
    }
}

struct Genre: Codable {
    let slug: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case slug
        case name = "nombre"
    }
}

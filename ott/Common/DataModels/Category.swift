struct Category: Decodable {
    let slug: String
    let name: String
    
    var items: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case slug
        case name = "nombre"
        case items = "medias"
    }
}

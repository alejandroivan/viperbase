struct MediaFile: Codable {
    let url: String
    let resolution: Int
    var type: String?
    var mime: String?
    
    enum CodingKeys: String, CodingKey {
        case url, type, mime
        case resolution = "resolucion"
    }
}

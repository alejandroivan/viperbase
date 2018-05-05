struct Chapter: Codable {
    let key: String
    let season: UInt
    let chapter: UInt
    
    let duration: String
    let durationInSeconds: Int?
    
    var title: String?
    var synopsis: String?
    
    let image: Image
    let files: [MediaFile]
    
    enum CodingKeys: String, CodingKey {
        case key
        case season = "temporada"
        case chapter = "capitulo"
        case duration = "duracion"
        case durationInSeconds = "duracion_sec"
        case title = "titulo"
        case synopsis = "sinopsis"
        case image = "imagenes"
        case files = "files"
    }
}

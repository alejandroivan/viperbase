struct Media: Decodable {
    let slug: String
    let name: String
    var classification: String
    
    var portraitImage: Image
    var landscapeImage: Image
    
    // Obligatorios en "medias/detail"," pero no en "playlists/home"
    var description: String?
    var year: UInt?
    var actors: [String]?
    var genres: [Genre]?
    
    // Opcionales
    var category: Category?
    var isUnique: Int?
    
    var visualizations: UInt?
    var seasons: UInt?
    var chapters: [Chapter]?
    
    
    enum CodingKeys: String, CodingKey {
        case slug
        case name = "nombre"
        case classification = "clasificacion"
        
        case portraitImage = "port_imagenes"
        case landscapeImage = "land_imagenes"

        case description = "descripcion"
        case year = "anio_produccion"
        case actors = "actores"
        case genres = "generos"
        
        case category = "categoria"
        case isUnique
        case visualizations = "t_visto"
        case seasons = "temporadas"
        case chapters
    }
}

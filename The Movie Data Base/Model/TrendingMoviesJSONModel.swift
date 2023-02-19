
import Foundation

// MARK: - TopMoviesTrendingMoviesJSONModel
struct TrendingMoviesJSONModel: Codable {
    let page: Int?
    let results: [TopMoviesResult]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - TopMoviesResult
struct TopMoviesResult: Codable {
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let title: String?
    let originalLanguage: TopMoviesOriginalLanguage?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let mediaType: TopMoviesMediaType?
    let genreids: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case id = "id"
        case title = "title"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreids = "genre_ids"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum TopMoviesMediaType: String, Codable {
    case movie = "movie"
}

enum TopMoviesOriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ko = "ko"
    case no = "no"
}

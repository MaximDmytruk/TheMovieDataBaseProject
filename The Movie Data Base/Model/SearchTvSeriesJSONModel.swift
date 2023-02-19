// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchTvSeriesJSONModel = try? JSONDecoder().decode(SearchTvSeriesJSONModel.self, from: jsonData)

import Foundation

// MARK: - SearchTvSeriesJSONModel
struct SearchTvSeriesJSONModel: Codable {
    let page: Int?
    let results: [SearchTvResult]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - SearchTvResult
struct SearchTvResult: Codable {
    let backdropPath: String?
    let firstAirDate: String?
    let genreids: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreids = "genre_ids"
        case id = "id"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

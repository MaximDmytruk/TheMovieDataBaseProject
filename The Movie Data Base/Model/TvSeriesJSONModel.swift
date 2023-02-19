
import Foundation

// MARK: - TvSeriesJSONModel
struct TvSeriesJSONModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let createdBy: [TvCreatedBy]?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [TvGenre]?
    let homepage: String?
    let id: Int?
    let inProduction: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: TvTEpisodeToAir?
    let name: String?
    let nextEpisodeToAir: TvTEpisodeToAir?
    let networks: [TvNetwork]?
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [TvNetwork]?
    let productionCountries: [TvProductionCountry]?
    let seasons: [TvSeason]?
    let spokenLanguages: [TvSpokenLanguage]?
    let status: String?
    let tagline: String?
    let type: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case inProduction = "in_production"
        case languages = "languages"
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case name = "name"
        case nextEpisodeToAir = "next_episode_to_air"
        case networks = "networks"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons = "seasons"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case type = "type"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - TvCreatedBy
struct TvCreatedBy: Codable {
    let id: Int?
    let creditid: String?
    let name: String?
    let gender: Int?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case creditid = "credit_id"
        case name = "name"
        case gender = "gender"
        case profilePath = "profile_path"
    }
}

// MARK: - TvGenre
struct TvGenre: Codable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

// MARK: - TvTEpisodeToAir
struct TvTEpisodeToAir: Codable {
    let airDate: String?
    let episodeNumber: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let productionCode: String?
    let runtime: Int?
    let seasonNumber: Int?
    let showid: Int?
    let stillPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case productionCode = "production_code"
        case runtime = "runtime"
        case seasonNumber = "season_number"
        case showid = "show_id"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - TvNetwork
struct TvNetwork: Codable {
    let id: Int?
    let name: String?
    let logoPath: String?
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

// MARK: - TvProductionCountry
struct TvProductionCountry: Codable {
    let iso3166_1: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name = "name"
    }
}

// MARK: - TvSeason
struct TvSeason: Codable {
    let airDate: String?
    let episodeCount: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let seasonNumber: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
}

// MARK: - TvSpokenLanguage
struct TvSpokenLanguage: Codable {
    let englishName: String?
    let iso639_1: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name = "name"
    }
}

//
//  File.swift
//  
//
//  Created by Sai Balaji on 30/10/22.
//

import Foundation

struct Consoles: Codable{
    let console: [[Console]]
}
struct Console: Codable{
    let ID: String
    let Name: String
}


struct TopUsers: Codable {
    let top10: Top10
}

// MARK: - Top10
struct Top10: Codable {
    let place1, place2, place3, place4: Place
    let place5, place6, place7, place8: Place
    let place9, place10: Place

    enum CodingKeys: String, CodingKey {
        case place1 = "place_1"
        case place2 = "place_2"
        case place3 = "place_3"
        case place4 = "place_4"
        case place5 = "place_5"
        case place6 = "place_6"
        case place7 = "place_7"
        case place8 = "place_8"
        case place9 = "place_9"
        case place10 = "place_10"
    }
}


struct Place: Codable {
    let user, score, trueratio: String
}

//MARK: - GAME LIST
struct GamesList: Codable{
    let game: [[Game]]
}
struct Game: Codable{
    let Title: String
    let ID: String
    let ConsoleID: String
    let ConsoleName: String
    let ImageIcon: String
    let NumAchievements: Int
    let NumLeaderboards: Int
    let Points: Int
    let DataModified: String?
    let ForumTopicID: Int?
}


//MARK: - GAME INFO EXTENDED

struct GameInfo: Codable{
    let ID: Int
    let Title: String
    let ConsoleID: Int
    let ImageIcon: String
    let ImageTitle: String
    let ImageIngame: String
    let ImageBoxArt: String
    let Publisher: String
    let Developer: String
    let Genre: String
    let Released: String
    let ConsoleName: String
    let NumAchievements: Int
    let NumDistinctPlayersCasual: String
    let NumDistinctPlayersHardcore: String
    let Achievements: [String: Trophies]
}

struct Trophies: Codable{
    let Title: String
    let Description: String
    let Points: String
    let DateEarned: String?
    let NumAwarded: String?
    let NumAwardedHardcore: String?
}

//MARK: - USER RECENT
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)



// MARK: - Welcome
struct Recents: Codable {
    let recent: [[Recent]]
}

// MARK: - Recent
struct Recent: Codable {
    let gameID, consoleID, consoleName, title: String
    let imageIcon, lastPlayed: String
    let numPossibleAchievements, possibleScore: Achieved
    let numAchieved, scoreAchieved: Achieved
    let numAchievedHardcore, scoreAchievedHardcore: Achieved

    enum CodingKeys: String, CodingKey {
        case gameID = "GameID"
        case consoleID = "ConsoleID"
        case consoleName = "ConsoleName"
        case title = "Title"
        case imageIcon = "ImageIcon"
        case lastPlayed = "LastPlayed"
        case numPossibleAchievements = "NumPossibleAchievements"
        case possibleScore = "PossibleScore"
        case numAchieved = "NumAchieved"
        case scoreAchieved = "ScoreAchieved"
        case numAchievedHardcore = "NumAchievedHardcore"
        case scoreAchievedHardcore = "ScoreAchievedHardcore"
    }
}

enum Achieved: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Achieved.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Achieved"))
    }
    
    var intValue: Int? {
            switch self {
            case .integer(let value): return value
            case .string(let value): return Int(value)
      }
    }

    
}

/*struct Welcome8: Codable {
    let recent: [[Recent]]
}

// MARK: - Recent
struct Recent: Codable {
    let gameID, consoleID, consoleName, title: String?
    let imageIcon, lastPlayed, numPossibleAchievements, possibleScore: String?
    let numAchieved, scoreAchieved: Achieved?
    let numAchievedHardcore, scoreAchievedHardcore: Int?
}

enum Achieved: Codable {
    case integer(Int)
    case string(String)
}*/


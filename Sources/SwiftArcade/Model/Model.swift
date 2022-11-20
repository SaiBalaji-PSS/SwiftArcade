//
//  File.swift
//  
//
//  Created by Sai Balaji on 30/10/22.
//

import Foundation

public struct Consoles: Codable{
    public let console: [[Console]]
}
public struct Console: Codable{
    public let ID: String
    public let Name: String
}


public struct TopUsers: Codable {
    public let top10: Top10
}

// MARK: - Top10
public struct Top10: Codable {
    public let place1, place2, place3, place4: Place
    public let place5, place6, place7, place8: Place
    public let place9, place10: Place

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


public struct Place: Codable {
    public let user, score, trueratio: String
}

//MARK: - GAME LIST
public struct GamesList: Codable{
    public let game: [[Game]]
}
public struct Game: Codable{
    public let Title: String
    public   let ID: String
    public   let ConsoleID: String
    public  let ConsoleName: String
    public  let ImageIcon: String
    public let NumAchievements: Int
    public let NumLeaderboards: Int
    public  let Points: Int
    public let DataModified: String?
    public let ForumTopicID: Int?
}


//MARK: - GAME INFO EXTENDED

public struct GameInfo: Codable{
    public  let ID: Int
    public  let Title: String
    public  let ConsoleID: Int
    public let ImageIcon: String
    public  let ImageTitle: String
    public  let ImageIngame: String
    public  let ImageBoxArt: String
    public  let Publisher: String
    public  let Developer: String
    public  let Genre: String
    public  let Released: String
    public let ConsoleName: String
    public let NumAchievements: Int
    public let NumDistinctPlayersCasual: String
    public  let NumDistinctPlayersHardcore: String
    public  let Achievements: [String: Trophies]
}

public struct Trophies: Codable{
    public  let Title: String
    public  let Description: String
    public let Points: String
    public let DateEarned: String?
    public let NumAwarded: String?
    public let NumAwardedHardcore: String?
}

//MARK: - USER RECENT
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)



// MARK: - Welcome
public struct Recents: Codable {
    public let recent: [[Recent]]
}

// MARK: - Recent
public struct Recent: Codable {
   public let gameID, consoleID, consoleName, title: String
    public let imageIcon, lastPlayed: String
    public let numPossibleAchievements, possibleScore: Achieved
    public let numAchieved, scoreAchieved: Achieved
    public let numAchievedHardcore, scoreAchievedHardcore: Achieved

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

public enum Achieved: Codable {
    case integer(Int)
    case string(String)

    public init(from decoder: Decoder) throws {
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
    
    public var intValue: Int? {
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


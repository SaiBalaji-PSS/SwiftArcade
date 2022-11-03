//
//  File.swift
//  
//
//  Created by Sai Balaji on 30/10/22.
//

import Foundation

class SwiftArcade{
   static  public var Shared = SwiftArcade()
    let session = URLSession(configuration: .default)
    
    //MARK: - CONSOLE LIST
    func getConsoleList(UserName: String,KEY: String,onCompletion:@escaping(Error?,[Console]?)->(Void)){
        let CONSOLE_LIST_URL = "https://ra.hfc-essentials.com/console_id.php?user=+\(UserName)+&key=+\(KEY)+&mode=json"
       
        let task = session.dataTask(with: URLRequest(url: URL(string: CONSOLE_LIST_URL)!)) { data, response, error in
            if let error = error{
                onCompletion(error,nil)
            }
            if let data = data{
                do{
                    let decodedData = try JSONDecoder().decode(Consoles.self, from: data)
                    onCompletion(nil,decodedData.console.flatMap { $0 })
                }
                catch{
                    print(error)
                    onCompletion(error,nil)
                }
            }
        }
        task.resume()
    }
    
    //MARK: - TOP TEN USERS
    func getTopTenUsers(UserName: String,KEY: String,onCompletion:@escaping(Error?,[Place]?)->(Void)){
        let TOP_TEN_USERS_URL = "https://ra.hfc-essentials.com/top_ten.php?user=+\(UserName)+&key=+\(KEY)+&mode=json"
        
        let task = session.dataTask(with: URLRequest(url: URL(string: TOP_TEN_USERS_URL)!)) { data, response, error in
            
            if let error = error{
                onCompletion(error,nil)
            }
            
            if let data = data{
                do{
                    let decodedData = try JSONDecoder().decode(TopUsers.self, from: data)
                    var topusers = [Place]()
                    topusers += [decodedData.top10.place1,decodedData.top10.place2,decodedData.top10.place3,decodedData.top10.place4,decodedData.top10.place5,decodedData.top10.place6,decodedData.top10.place7,decodedData.top10.place8,decodedData.top10.place9,decodedData.top10.place10]
                    onCompletion(nil,topusers)
                }
                catch{
                    print(error)
                    onCompletion(error,nil)
                
                }
            }
           
            
        }
        task.resume()
    }
    //MARK: - GAMES LIST FOR A GIVEN CONSOLE ID
    func getGamesList(UserName: String,KEY: String,ConsoleID: Int,onCompletion:@escaping(Error?,[Game]?)->(Void)){
        let GAME_LIST_URL = "https://ra.hfc-essentials.com/game_list.php?user=+\(UserName)+&key=+\(KEY)+&console=\(ConsoleID)&mode=json"
        let task = session.dataTask(with: URLRequest(url: URL(string: GAME_LIST_URL)!)) { data, response, error in
            if let error = error{
                print(error)
                onCompletion(error,nil)
            }
            if let data = data{
                do{
                    let decodedData = try JSONDecoder().decode(GamesList.self, from: data)
                    print(decodedData.game)
                    onCompletion(nil,decodedData.game.flatMap{$0})
                }
                catch{
                    
                    print(error)
                    onCompletion(error,nil)
                }
            }
        }
        task.resume()
    }
    
    //MARK: - GAME INFO AND TROPHIES FOR A PARTICULAR GAME
    //Gives both earned and non-earned trophies. Filter the earned from non-earned trophies by filter HOF
    func getGameInfoAndTropies(UserName: String,KEY: String,GameID: Int,onCompletion:@escaping(Error?,[Trophies]?)->(Void)){
        let GAMEINFO_TROPHY_URL = "https://ra.hfc-essentials.com/game_progress.php?user=+\(UserName)+&key=+\(KEY)+&game=\(GameID)&mode=json"
        
        let task = session.dataTask(with: URLRequest(url: URL(string: GAMEINFO_TROPHY_URL)!)) { data, response, error in
            if let error = error{
                onCompletion(error,nil)
            }
            if let data = data{
                do{
                    let decodedData = try JSONDecoder().decode(GameInfo.self, from: data)
                    print(decodedData.Title)
                    var Tropies = [Trophies]()
                    for v in decodedData.Achievements.values{
                        Tropies.append(v)
                    }
                    onCompletion(nil,Tropies)
                }
                catch{
                    print(error)
                    onCompletion(error,nil)
                }
            }
        }
        task.resume()
        
    }
    
    //MARK: - RECENT GAMES FOR A GIVEN USER
    func getRecentGames(User: String,KEY: String,OtherUser: String,onCompletion:@escaping(Error?,Recents?)->(Void)){
        let RECENT_URL = "https://ra.hfc-essentials.com/user_recent.php?user=+\(User)+&key=+\(KEY)+&member=\(OtherUser)&results=10&mode=json"
        print(RECENT_URL)
      
        let task = session.dataTask(with: URLRequest(url: URL(string: RECENT_URL)!)) { data, response, error in
            if let error = error{
                print(error)
                onCompletion(error,nil)
            }
            if let data = data{
                do{
                    let decodedData = try JSONDecoder().decode(Recents.self, from: data)
                    onCompletion(nil,decodedData)
                }
                catch{
                    print(error)
                    onCompletion(error,nil)
                }
            }
        }
        task.resume()
    }
    
}

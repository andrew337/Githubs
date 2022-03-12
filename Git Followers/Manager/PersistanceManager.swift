//
//  PersistanceManager.swift
//  Git Followers
//
//  Created by Admin on 3/11/22.
//

import Foundation

enum PersistanceActionType {
    case add, remove
}

enum PersistanceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite : Follower, actionType : PersistanceActionType, completed : @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var newFavorites = favorites
                switch actionType {
                case .add:
                    guard !newFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    newFavorites.append(favorite)
                case .remove:
                    newFavorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: newFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed : @escaping (Result<[Follower], GFError>) -> Void) {
        
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites : [Follower]) -> GFError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedfavorites = try encoder.encode(favorites)
            defaults.set(encodedfavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}

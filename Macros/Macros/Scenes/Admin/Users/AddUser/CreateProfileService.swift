//
//  CreateProfileService.swift
//  Macros
//
//  Created by Leonardo Durazo on 19/06/21.
//
import Combine
import Firebase

protocol CreateProfileService {
    func invoke(id: String, _ model: Profile.Request) -> Future<String, MacroError>
}

final class CreateProfileServiceImp {
    private let db: Firestore
    private lazy var docRef = db.collection("users")
    init(db: Firestore = Firestore.firestore()) {
        self.db = db
    }
}

extension CreateProfileServiceImp: CreateProfileService {
    func invoke(id: String, _ model: Profile.Request) -> Future<String, MacroError> {
        return Future() { [weak self] promise in
            guard let data = try? JSONEncoder().encode(model),
                  let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                      return promise(.failure(.serialization))
                  }
            self?.docRef.document(id).setData(json) { error in
                guard error == nil else {
                    promise(.failure(.noData))
                    return
                }
                promise(.success(id))
            }
        }
    }
}

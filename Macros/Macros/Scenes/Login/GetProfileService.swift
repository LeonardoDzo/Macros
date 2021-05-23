//
//  GetProfileService.swift
//  Macros
//
//  Created by Leonardo Durazo on 22/05/21.
//
import Combine
import FirebaseFirestore

struct ProfileModelResponse: Decodable {
    var id: String?
    var phone: Int
    var email: String?
    var lastName: String
    var firstName: String
    var gender: String
}

protocol GetProfileService {
    func invoke(uid: String) -> Future<ProfileModelResponse, Error>
}

final class GetProfileServiceImp {
    let db: Firestore
    private lazy var docRef = db.collection("users")

    init(db: Firestore = .firestore()) {
        self.db = db
    }
}

extension GetProfileServiceImp: GetProfileService {
    func invoke(uid: String) -> Future<ProfileModelResponse, Error> {
        return Future() { [weak self] promise in
            self?.docRef.document(uid).getDocument(completion: { result, error in
                guard error == nil else {
                    promise(.failure(error!))
                    return
                }

                do {
                    guard let result = result else {
                        promise(.failure(MacroError.noData))
                        return
                    }
                    promise(.success(try result.decode()))
                } catch {
                    promise(.failure(error))
                }
            })
        }
    }
}

enum MacroError: Error {
    case noData
}

extension DocumentSnapshot {
    func decode<T: Decodable>(decoder: JSONDecoder = .init()) throws -> T {
        guard let data = self.data() else { throw MacroError.noData }
        let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
        return try decoder.decode(T.self, from: jsonData)
    }
}

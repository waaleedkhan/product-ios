//  Created on 6/4/21.

import Foundation

protocol Repository {
    
    associatedtype Model
    associatedtype Handler
    
    func get(by: Int) -> Model?
    func delete() -> Model?
    func getAll(callback: Handler)
    
}

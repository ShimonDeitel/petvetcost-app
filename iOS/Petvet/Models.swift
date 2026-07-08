import Foundation

struct VetVisit: Identifiable, Codable, Equatable {
    let id: UUID
    var createdAt: Date
    var petName: String
    var reason: String
    var cost: Double
    var nextDueDate: Date
    var notes: String

    init(id: UUID = UUID(), createdAt: Date = Date(), petName: String = "", reason: String = "", cost: Double = 0, nextDueDate: Date = Date(), notes: String = "") {
        self.id = id
        self.createdAt = createdAt
        self.petName = petName
        self.reason = reason
        self.cost = cost
        self.nextDueDate = nextDueDate
        self.notes = notes
    }
}

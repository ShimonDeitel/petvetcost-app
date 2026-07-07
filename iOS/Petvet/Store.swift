import Foundation
import Combine

@MainActor
final class Store: ObservableObject {
    @Published var items: [VetVisit] = []
    @Published var isPro: Bool = false

    static let freeLimit = 8

    private let fileURL: URL = {
        let dir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir.appendingPathComponent("petvet_items.json")
    }()

    init() {
        load()
    }

    var canAddMore: Bool {
        isPro || items.count < Store.freeLimit
    }

    func add(_ item: VetVisit) {
        items.insert(item, at: 0)
        save()
    }

    func update(_ item: VetVisit) {
        guard let idx = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[idx] = item
        save()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    func delete(_ item: VetVisit) {
        items.removeAll { $0.id == item.id }
        save()
    }

    private func load() {
        if let data = try? Data(contentsOf: fileURL),
           let decoded = try? JSONDecoder().decode([VetVisit].self, from: data) {
            items = decoded
        } else {
            items = Store.seedData
        }
    }

    func save() {
        if let data = try? JSONEncoder().encode(items) {
            try? data.write(to: fileURL, options: .atomic)
        }
    }

    static let seedData: [VetVisit] = [
        VetVisit(petName: "Petname 1", reason: "Reason 1", cost: 10.0, nextDueDate: Date().addingTimeInterval(-86400), notes: "Notes 1"),
        VetVisit(petName: "Petname 2", reason: "Reason 2", cost: 20.0, nextDueDate: Date().addingTimeInterval(-172800), notes: "Notes 2"),
        VetVisit(petName: "Petname 3", reason: "Reason 3", cost: 30.0, nextDueDate: Date().addingTimeInterval(-259200), notes: "Notes 3")
    ]
}

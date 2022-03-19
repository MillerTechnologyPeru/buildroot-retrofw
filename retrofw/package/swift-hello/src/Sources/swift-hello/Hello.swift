import Foundation

@main
struct Hello {
    static func main() async throws {
        print("Hello, world! 👋")
        let task = Task {
            var didCatchError = false
            do { try await errorTest() }
            catch CocoaError.userCancelled { didCatchError = true }
            catch { fatalError() }
            print("Task ran")
        }
        for _ in 0 ..< 10 {
            print(UUID())
            try await Task.sleep(1_000_000_000)
        }
    }
}

func errorTest() async throws {
    print("Will throw")
    throw CocoaError(.userCancelled)
}


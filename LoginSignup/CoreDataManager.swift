import UIKit
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()
    private init() {}

    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    // MARK: - Save User
    func saveUser(firstName: String, lastName: String, email: String, password: String) -> Bool {

        // Check if user already exists
        if fetchUserByEmail(email: email) != nil {
            return false  // user exists
        }

        let user = User(context: context)
        user.firstName = firstName
        user.lastName = lastName
        user.email = email.lowercased()
        user.password = password  // later we will hash
        
        do {
            try context.save()
            return true
        } catch {
            print("Failed to save user: \(error)")
            return false
        }
    }

    // MARK: - Fetch User By Email
    func fetchUserByEmail(email: String) -> User? {
        let request = User.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@", email.lowercased())

        do {
            let users = try context.fetch(request)
            return users.first
        } catch {
            print("Error fetching user: \(error)")
            return nil
        }
    }

    // MARK: - Verify login
    func verifyUser(email: String, password: String) -> Bool {
        guard let user = fetchUserByEmail(email: email) else { return false }
        return user.password == password
    }
}

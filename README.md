# 📝 Challenge2Americano

**Challenge2Americano** is an iOS app built using **SwiftUI** and **SwiftData**, designed to create, view, and manage notes through a clean and modern interface.  
The project includes multiple screens, persistent data management, and a simple, intuitive UI.

---

## 📂 Project Structure

Challenge2Americano

├── ChallengeApp.swift

├── PreMainView.swift

├── MainPageView.swift

├── NoteView.swift

├── NotePage.swift

├── UovoView.swift

├── Assets.xcassets

└── DataFile.swift

---

## 🔧 Technologies Used

- SwiftUI  
- SwiftData  
- iOS 26.1
- Xcode 26.1.1  

---

## 📌 Key Features

### ✔️ Note Management
- Create new notes  
- View the full list of notes  
- Edit and auto-save notes  
- Smooth navigation with `NavigationStack`  

### ✔️ Data Model (SwiftData)

Defined in `DataFile.swift`:

```swift
@Model
class DataItem: Identifiable {
    var id: UUID = UUID()
    var Title: String
    var Text: String
}
```
✔️ Included Screens: 

PreMainView – initial landing view

MainPageView – note list screen

NotePage – note editor / viewer

---

## 🚀 How to Run the Project
Clone the repository:

```bash
git clone https://github.com/Aphathic/Challenge2Americano.git
Open the project in Xcode:
```

Press ⌘ + R to run

---

🧩 SwiftData Persistence
The app initializes SwiftData in ChallengeApp.swift:

```swift
@main
struct ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            PreMainView()
                .modelContainer(for: DataItem.self)
        }
    }
}
```
SwiftData automatically handles the saving, loading, and syncing of the note items.

📈 Future Improvements
- Search functionality
- Sorting options
- Note categories / tags
- iCloud sync
- Advanced UI animations

## 👤 Author
Developed by Crescenzo Di Franco November
2025

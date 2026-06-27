# Student Records — Flutter + Cloud Firestore

Ekta simple Flutter app jeta Student **Name**, **Roll** ar **Department** (bonus)
Cloud Firestore te save kore ar real-time e ListView te dekhায়।

---

## ⚠️ Important — age ekbar poro

Ei zip e ami **shudhu source code** (`lib/`, `pubspec.yaml`, README) dilam.
Firebase er **`firebase_options.dart`** ar **`google-services.json`** files gula
tomar nijer Firebase account theke generate korte hoy — oigula ami banaite pari na.
Tai niche er steps follow koro (5-10 min lagbe).

---

## Step-by-Step Setup

### 1. Platform folders generate koro
Ei project e android/ios native folder dewa nai (size kom rakhar jonno).
Project folder er vitore giye ekbar run koro — eta android/ios/web scaffolding banaye dibe,
kintu tomar `lib/` ar `pubspec.yaml` overwrite korbe na:

```bash
cd student_firestore
flutter create .
```

### 2. Firebase project banao
1. https://console.firebase.google.com te jao → **Add project**
2. Project bananor por baam pasher menu theke **Firestore Database** → **Create database**
   → **Start in test mode** (assignment er jonno test mode thik ache)
3. Region select kore **Enable** koro

### 3. FlutterFire diye connect koro
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```
- Tomar Firebase project select koro
- Android/iOS/web platform select koro
- Eta automatically `lib/firebase_options.dart` ar `android/app/google-services.json`
  generate kore dibe (template ta replace hoye jabe)

### 4. Dependencies install koro
```bash
flutter pub get
```

### 5. Run koro
```bash
flutter run
```

---

## Firestore Structure

Collection: `students`

```json
{
  "name": "Rahim",
  "roll": "101",
  "department": "CSE"
}
```

> Note: `name` ar `roll` required. `department` optional (bonus task).

---

## Project Structure

```
student_firestore/
├── pubspec.yaml
├── analysis_options.yaml
├── README.md
└── lib/
    ├── main.dart                  # App entry + Firebase init (Task 1)
    ├── firebase_options.dart      # ⚠️ flutterfire configure diye replace koro
    ├── models/
    │   └── student.dart           # Student data model
    ├── services/
    │   └── firestore_service.dart # Create + Read logic (Task 2 & 3)
    └── screens/
        └── student_screen.dart    # Full UI (Task 4)
```

---

## Task Mapping

| Task | Kothay ase |
|------|-----------|
| Task 1: Firebase Integration | `main.dart` + `firebase_options.dart` |
| Task 2: Create Student Data  | `firestore_service.addStudent()` + Save button |
| Task 3: Read Student Data    | `firestore_service.getStudents()` + StreamBuilder |
| Task 4: UI + clear + SnackBar | `student_screen.dart` |
| Bonus: Department field      | Teen number TextField + model e add kora ase |

---

## Common Issue

- **App khulei crash / "not configured for this platform"** → `flutterfire configure`
  cholao nai, ba template `firebase_options.dart` replace hoy nai.
- **Permission denied** → Firestore rules **test mode** e ase kina check koro.
- **Manually console e add kora doc dekhai na** → app newest-first sort kore;
  refresh dile ba app theke add korle thik moto dekhabe.

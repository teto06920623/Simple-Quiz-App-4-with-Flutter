# 🧠 Flutter Quiz App

A sleek, modern, and interactive **Quiz Application** built with **Flutter**. This project demonstrates dynamic state handling, custom UI components, and a smooth user experience for taking multiple-choice tests with real-time feedback.

## 📸 Screenshots

<div align="center">
  <table style="border: none; border-collapse: collapse;">
    <tr>
      <td align="center" style="border: none;">
        <img src="https://github.com/user-attachments/assets/409cf535-a272-45d7-ac3a-da02a5f05940" width="200" alt="Welcome Screen" />
        <br /><sub><strong>Welcome/Start Screen</strong></sub>
      </td>
      <td align="center" style="border: none;">
        <img src="https://github.com/user-attachments/assets/a280a610-7ca7-47f4-a7a8-3d4740f7ba97" width="200" alt="Quiz Question" />
        <br /><sub><strong>Question Interface</strong></sub>
      </td>
      <td align="center" style="border: none;">
        <img src="https://github.com/user-attachments/assets/f26761a6-e871-4dde-b9fe-527936e8cd5f" width="200" alt="Selected Answer" />
        <br /><sub><strong>Answer Selection</strong></sub>
      </td>
      <td align="center" style="border: none;">
        <img src="https://github.com/user-attachments/assets/edace4bd-00c7-4459-8b5f-20be9f59a7e6" width="200" alt="Score Dialog" />
        <br /><sub><strong>Final Result Dialog</strong></sub>
      </td>
    </tr>
  </table>
</div>

## ✨ Features

- **Dynamic Question Loading:** Seamlessly iterates through a list of questions and answers.
- **Interactive UI:** - Visual feedback when an answer is selected (Color change to Green).
  - Validation to ensure an answer is picked before moving to the next question.
- **Score Tracking:** Automatically calculates the final score based on correct answers.
- **Completion Feedback:** Custom `AlertDialog` to display the final result once the quiz is finished.
- **Polished Design:** Uses a modern dark theme with clean "Question Cards" and rounded buttons.

## 🛠️ Technologies Used

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **State Management:** `StatefulWidget` & `setState`.
- **Layout Tools:** `Stack`, `ListView.builder`, and `Gap`.

## 📂 Project Structure

```text
lib/
├── main.dart            # App entry point & Theme configuration
├── model.dart           # Data models for Questions and Answers list
└── quiz_screen.dart     # Core logic for the quiz and UI rendering
```

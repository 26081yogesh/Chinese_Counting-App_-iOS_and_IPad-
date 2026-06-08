# Chinese Numbers (iOS / iPadOS)

A beautiful, interactive language learning application built natively for iOS and iPadOS. The app helps users master Chinese numbers through randomized interactive quizzes, visual pinyin reinforcement, and real-time audio pronunciation via native Text-to-Speech engines.

## 📱 App Preview

<img width="1440" height="900" alt="3" src="https://github.com/user-attachments/assets/309cc62a-f0de-42e3-9481-db1a877ceebc" />
<img width="1440" height="900" alt="2" src="https://github.com/user-attachments/assets/cc7bbe6a-d3bc-40e2-85e8-461d90b11ed9" />
<img width="1440" height="900" alt="1" src="https://github.com/user-attachments/assets/b0b05508-8e66-432b-b496-7501a6e2c10f" />


---

## 🚀 Features

* **Responsive Multi-Device Layout:** Fully optimized for both iPhone and iPad screens using an adaptive UI layout.
* **Dynamic Quote Engine:** Fetches and displays a "Daily Wisdom" Chinese idiom (Chengyu) with full pinyin and English translations upon app launch.
* **Interactive Learning Loop:** Generates randomized 10-question quizzes to test number comprehension with 4-option multiple-choice logic.
* **Native Text-to-Speech:** Integrated an audio pronunciation manager enabling users to hear native Mandarin pronunciations of the numbers dynamically.
* **Real-time State Management:** Tracking streaks, correct answers, and displaying a native results card upon game completion.

---

## 🛠️ Tech Stack & Engineering Highlights

* **Framework:** UIKit / SwiftUI (Adaptive Layout)
* **Audio Management:** `AVFoundation` (`AVSpeechSynthesizer`, `AVSpeechUtterance`) for native text-to-speech rendering.
* **Networking:** Async REST API integration for pulling dynamic proverbs and language content.
* **Data Architecture:** Programmatic modeling of the Chinese numbering system linking integers (`Int`), Hanzi (`String`), and Pinyin (`String`).

---

## 🧠 Technical Challenges Overcome

### 1. Robust Audio Lifecycle Management (`AVAudioEngine` / `AVSpeechSynthesizer`)
**Challenge:** Managing audio buffer lifecycles and ensuring text-to-speech requests don't choke the main UI thread or attempt to execute on unallocated PCM audio buffers.
**Solution:** Developed a dedicated Sound/Speech Manager abstraction layer that ensures safe state validation before feeding text requests into the synthesis queue, preventing runtime silent failures.

### 2. Scalable Multi-Device UI Adaptability
**Challenge:** Ensuring that a highly visual card layout renders perfectly centered and proportional across a small iPhone screen and a larger iPad device.
**Solution:** Leveraged auto-adaptive constraints/containers to seamlessly reflow layout metrics, maintaining crisp typography scaling and button tap targets on all target form factors.

---

1. Clone this repository:
   ```bash
   git clone [https://github.com/YOUR_USERNAME/chinese-numbers-ios.git](https://github.com/YOUR_USERNAME/chinese-numbers-ios.git)

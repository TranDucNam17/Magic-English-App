# MAGIC ENGLISH – UI STRUCTURE MAP

Tài liệu mô tả toàn bộ cấu trúc giao diện của ứng dụng Magic English, dựa theo file thiết kế gốc.

---

## 1. Onboarding
- Màn hình giới thiệu ứng dụng
- Chuyển slide
- Animation nhẹ
- CTA: Get Started / Continue

---

## 2. Authentication
### 2.1 Login
- Email / Password
- Báo lỗi sai mật khẩu
- Xử lý trường hợp Offline

### 2.2 Register
- Email, Password, Confirm Password
- Điều kiện password strong
- Gửi email xác minh (nếu có)

### 2.3 Forgot Password
- Nhập Email
- Nhập OTP
- Reset password

---

## 3. Home Dashboard (Màn chính)
Trang tổng quan chứa các module chính:

### 3.1 Daily Streak
- Hiển thị chuỗi ngày học
- Biểu đồ streak theo tuần/tháng
- Gợi ý duy trì streak

### 3.2 Achievements
- Huy hiệu theo mốc (3-7-14-30 ngày…)
- Tiến độ đạt từng huy hiệu

### 3.3 Notifications
- Danh sách thông báo
- Nhắc học mỗi ngày
- Thông báo từ AI

---

## 4. Magic Vocab (FR1)
Module chính xử lý toàn bộ phần từ vựng.

### 4.1 Add Word
- Nhập từ nhanh
- Gợi ý auto-complete (nếu có)

### 4.2 AI Enrich
- Lấy IPA
- Nghĩa
- CEFR
- Ví dụ
- Loại từ

### 4.3 Save
- Lưu từ vào database cá nhân

### 4.4 List
- Danh sách toàn bộ từ đã lưu
- Sắp xếp theo: Alphabet / Ngày học / CEFR

### 4.5 Word Detail
- Toàn bộ thông tin enrich
- Nút sửa / xóa

### 4.6 Search / Filter
- Tìm kiếm theo keyword
- Lọc theo CEFR
- Lọc theo loại từ

---

## 5. Grammar Checker (FR2)
### 5.1 Input
- Text editor
- Nhập câu hoặc đoạn văn

### 5.2 AI Result
- Điểm số chất lượng câu
- Đánh giá độ tự nhiên

### 5.3 Highlight
- Highlight lỗi ngữ pháp
- Highlight lỗi chính tả
- Suggest rewrite cho từng chỗ sai

### 5.4 Suggestion
- Gợi ý câu viết lại mượt hơn

### 5.5 History
- Lịch sử các lần chấm

---

## 6. Progress Tracking (FR3)
### 6.1 Statistics Overview
- Tổng số từ đã học
- Tổng số bài đã chấm

### 6.2 CEFR Chart
- Biểu đồ số lượng từ theo CEFR (A1 → C2)

### 6.3 Word Type Chart
- Danh sách loại từ theo nhóm (noun / verb / adj…)

### 6.4 Learning History
- Timeline các hoạt động đã học

---

## 7. AI Assistant
### 7.1 Chat
- Giao diện chat dạng hội thoại
- Nhắn – nhận – lưu context

### 7.2 History
- Danh sách các cuộc hội thoại cũ

---

## 8. Practice Center
### 8.1 Flashcards
- Ôn lại từ qua lật thẻ

### 8.2 Quiz
- Trắc nghiệm từ vựng

### 8.3 Listening
- Nghe – chọn đáp án

### 8.4 Random Challenges
- Bài tập ngẫu nhiên tăng động lực

---

## 9. Profile
### 9.1 Info
- Thông tin người dùng
- Email, username

### 9.2 Avatar
- Thay ảnh đại diện

### 9.3 CEFR Goal
- Thiết lập mục tiêu học
- Theo dõi % hoàn thành

### 9.4 Summary
- Tóm tắt thành tích cá nhân

---

## 10. Settings
### 10.1 Theme
- Light / Dark / Auto

### 10.2 Language
- Ngôn ngữ giao diện

### 10.3 Notifications
- Bật/tắt nhắc học mỗi ngày

### 10.4 Security
- Đổi mật khẩu
- Ẩn danh (nếu có)

### 10.5 Sync
- Đồng bộ dữ liệu
- Backup / Restore (tùy chọn)

---


---

## 1. Auth & Onboarding
- Onboarding intro (3)
- Login (1)
- Register (1)
- Forgot password (2 – nhập email + OTP)

**Tổng: 5 màn**

---

## 2. Home Dashboard
Dashboard bao gồm:
- Streak
- Tổng từ đã học
- Huy hiệu
- CEFR chart
- Word-type chart
- Biểu đồ Streak (Line chart)

Màn hình:
- Home Dashboard (1)
- Daily Streak detail (1)
- Achievements (1)
- Notifications (1)

**Tổng: 4 màn**

---

## 3. FR1 – Magic Vocabulary (Module quan trọng nhất)
### Các màn hình:
- Add new word (Magic Vocab Input)
- AI-enriched preview modal (optional)
- Vocabulary notebook list
- Search & filter
- Word detail (IPA, nghĩa, CEFR, ví dụ)

**Tổng FR1: 4–5 màn**

---

## 4. FR2 – Grammar & Style Checker
- Grammar checker input
- Result screen (highlight + gợi ý sửa)
- Writing history
- Correction detail

**Tổng: 4 màn**

---

## 5. FR3 – Progress Tracking
- Statistics overview
- CEFR Chart detail
- Word-type chart detail
- Learning history

**Tổng: 4 màn**

---

## 6. Practice Center (optional)
- Flashcards
- Mini test / Quiz
- Listening
- Random challenges

**Tổng: 4 màn**

---

## 7. AI Assistant
- Chat screen
- Conversation history
- Suggested prompts

**Tổng: 3 màn**

---

## 8. Profile & Settings
- Profile
- CEFR goal setting
- User history
- Avatar edit
- Settings main
- Language setting
- Theme setting
- Notification setting
- Security / Privacy
- Account sync

**Tổng: 10 màn (có thể gộp còn 5 màn)**

---

## 9. System Screens (bắt buộc)
- Offline screen
- Server error screen
- App update required

**Tổng: 3 màn**
"""

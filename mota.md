# MAGIC ENGLISH – PROJECT SPECIFICATION

## 1. Project Overview

Magic English là một ứng dụng học tiếng Anh đa nền tảng (Web/Mobile), được xây dựng nhằm giải quyết ba vấn đề lớn của người tự học:

1. Lưu trữ từ vựng phân tán, khó tra cứu.
2. Thiếu phản hồi khi luyện viết.
3. Không có công cụ theo dõi tiến độ và tạo động lực.

Ứng dụng sử dụng AI (Ollama Cloud API) để tối ưu việc học: enrich từ vựng, chấm điểm câu, gợi ý cải thiện phong cách viết và theo dõi tiến độ học tập hằng ngày.

---

## 2. Business Problem & Context

### Pain Points

**1. Quản lý từ vựng rời rạc & dễ quên**
- Người học ghi chép từ vào sổ tay, Excel, nhiều app khác nhau.
- Tốn thời gian nhập IPA, nghĩa, ví dụ → dễ nản, dễ quên.

**2. Thiếu phản hồi viết lách tức thời**
- Luyện viết nhưng không biết câu đã đúng, natural chưa.
- Phản hồi từ giáo viên thường chậm/hạn chế.

**3. Khó theo dõi tiến độ & mất động lực**
- Nhiều app rời rạc → không thấy bức tranh tổng quan.
- Không biết số từ đã học, streak bao nhiêu → dễ bỏ cuộc.

### Opportunity

Xây dựng một **ứng dụng all-in-one**:
- Quản lý từ vựng thông minh
- Kiểm tra ngữ pháp bằng AI
- Theo dõi tiến độ trực quan + gamification

---

## 3. Target Users

### Persona: Người tự học Tiếng Anh có kỷ luật
- Muốn duy trì thói quen học đều đặn.
- Không thích làm việc thủ công tốn thời gian.
- Cần phản hồi nhanh để cải thiện.
- Muốn nhìn thấy sự tiến bộ mỗi ngày.

### User Needs
- Lưu từ nhanh (vài giây).
- Chấm câu tức thì.
- Dashboard rõ ràng, dễ nhìn, truyền động lực.

---

## 4. Functional Requirements (FR)

### FR1 – Magic Vocab (Quản lý Từ vựng Thông minh)

**FR1.1**: Nhập từ mới  
**FR1.2**: AI Enrichment:
- Gọi AI API (Ollama)
- Trả về: IPA, nghĩa, loại từ, câu ví dụ, CEFR

**FR1.3**: Lưu trữ cá nhân vào Database  
**FR1.4**: Hiển thị sổ tay từ vựng
- Tìm kiếm
- Lọc theo loại từ
- Lọc CEFR
- Sắp xếp (ngày học / alphabet / độ khó)

---

### FR2 – Grammar & Style Checker

**FR2.1**: Nhập câu/đoạn văn
- Text editor đơn giản, dễ gõ

**FR2.2**: Gửi câu tới AI → phân tích lỗi  
**FR2.3**: Hiển thị kết quả
- Điểm số chất lượng câu
- Highlight lỗi ngữ pháp, từ vựng, chính tả
- Gợi ý cách viết mượt và tự nhiên hơn

---

### FR3 – Stats & Streaks (Theo dõi Tiến độ)

**FR3.1**: Tự động tracking hoạt động học  
**FR3.2**: Tính streak chính xác
- Reset khi nghỉ 1 ngày

**FR3.3**: Dashboard tổng quan
- Tổng số từ đã học
- Huy hiệu milestone (3 – 7 – 30 ngày…)

**FR3.4**: Visualization
- Biểu đồ tròn: Loại từ
- Biểu đồ cột: CEFR
- Biểu đồ line: Streak

---

## 5. Non-Functional Requirements (NFR)

### NFR1: Performance
- Thao tác AI trả về kết quả trong 3–5 giây.

### NFR2: Usability
- UI tối giản – sạch – xanh trắng chủ đạo
- Ít chữ – nhiều biểu đồ trực quan

### NFR3: Accuracy
- Nghĩa/IPA phải chính xác
- Streak phải tính đúng tuyệt đối

### NFR4: Configurability
- Chọn model AI theo ý muốn
- Hỗ trợ mô hình local hoặc cloud

---

## 6. Constraints & Assumptions

### Constraints
1. Phụ thuộc vào dịch vụ AI bên thứ ba (Ollama Cloud).
2. Chất lượng tính năng = chất lượng model AI.
3. Dự án mang tính cá nhân → không cần nhiều user levels, payment,…

### Assumptions
- Người dùng luôn có Internet.
- Người dùng có động lực tự học.

---

## 7. Core Value Proposition
- Tự động hóa các thao tác tốn thời gian.
- Phản hồi nhanh – chính xác – rõ ràng.
- Tạo thói quen học đều đặn mỗi ngày.
- Chỉ cần 10 phút/ngày vẫn tạo tiến bộ.  

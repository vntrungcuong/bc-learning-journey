# AL Maintainability Principles

## Nguyên tắc

- **KISS**: chọn giải pháp đơn giản nhất đáp ứng đúng business behavior.
- **DRY**: tránh lặp business logic, nhưng không tạo abstraction chỉ để loại bỏ vài dòng code.
- **SOLID thực dụng**: codeunit có trách nhiệm rõ; dùng interface khi cần nhiều implementation, thay thế implementation hoặc test seam.
- Ưu tiên AL-native patterns: event subscriber, integration event, codeunit, interface, extension và Job Queue.
- Không áp dụng máy móc Repository, CQRS hoặc dependency injection kiểu C# nếu không phù hợp với Business Central.
- Giữ public surface nhỏ; ưu tiên procedure và biến có scope nhỏ nhất.

## Comments và documentation

- Comment và XML documentation dùng tiếng Anh.
- Comment giải thích lý do, workaround hoặc limitation; không mô tả lại syntax hiển nhiên.
- Public hoặc non-obvious procedure nên có XML documentation khi runtime/language version hỗ trợ.
- Tên object, procedure, field và label phải tự mô tả để giảm nhu cầu comment.

## Review

Mỗi thay đổi cần xem xét readability, upgrade impact, testability, security và performance trade-off. Không đánh đổi correctness để lấy micro-optimization chưa được đo.

# Naming và phân bổ ID

## Nguồn sự thật

Luôn đọc `app.json` trước khi tạo object. Project hiện tại có object ID range `50100-50149`, nhưng phải ưu tiên giá trị thực tế trong file khi metadata thay đổi.

## Quy tắc

- Tên file dùng tiếng Anh, kebab-case hoặc convention AL hiện có.
- Tên object và procedure dùng PascalCase theo convention AL của project.
- Tên phải mô tả business purpose, không dùng tên mơ hồ như `Helper` nếu không có phạm vi rõ.
- Object ID phải nằm trong `idRanges`.
- Mỗi feature cần ghi lại ID đã dùng để tránh trùng.
- Không sửa app identity, publisher hoặc ID range chỉ để giải quyết nhanh một feature.

## Prefix

Không tự đoán publisher prefix. Prefix chỉ được dùng khi:

1. Có trong metadata hoặc convention đã xác nhận.
2. Người dùng xác nhận rõ.
3. Có tài liệu project làm nguồn tham chiếu.

Nếu chưa xác định, dùng placeholder `[PREFIX CẦN XÁC NHẬN]` trong plan và hỏi trước khi tạo code.

## Phân bổ ID

Trước khi implement feature nhiều object, lập bảng:

| Object type | Object name | ID | Feature |
| --- | --- | --- | --- |
| Page Extension | `<Name>` | `<ID>` | `<Feature>` |

Không tái sử dụng ID của object khác. Với project nhỏ, nên dành một khoảng liên tiếp cho một feature và cập nhật bảng allocation trong plan hoặc documentation phù hợp.

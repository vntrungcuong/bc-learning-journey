# AI và User Experience Guidelines

## Trước khi triển khai AI

- Xác định user problem và thao tác cần giảm tải.
- Xác định dữ liệu được dùng, quyền truy cập, data minimization và privacy.
- Có human confirmation cho thao tác tạo/sửa/xóa/posting hoặc hành vi có rủi ro.
- Có fallback khi AI không khả dụng, trả lời không chắc chắn hoặc dữ liệu không đủ.
- Không để AI bypass permission hoặc business validation.
- Ghi nhận audit/telemetry cần thiết và không log dữ liệu nhạy cảm.

## UX và performance

- UI phải rõ ràng, dễ tìm, ít thao tác thừa và phù hợp page type.
- Hiển thị loading, empty, error và retry state phù hợp.
- Đánh giá payload, latency, concurrency và chi phí inference theo workload.
- Không hứa hẹn kết quả chính xác tuyệt đối nếu AI không có grounding/validation.
- Ưu tiên giải pháp native Business Central và khả năng maintain lâu dài.

## Validation

- Test permission, fallback, invalid/ambiguous input và human confirmation.
- Kiểm tra behavior khi AI service timeout hoặc không phản hồi.
- Đánh giá UX với workflow thực tế, không chỉ compile thành công.

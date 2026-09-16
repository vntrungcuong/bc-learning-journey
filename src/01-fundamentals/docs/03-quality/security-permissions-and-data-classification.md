# Security, Permission và DataClassification

## Checklist

- Xác định user role và thao tác cần được phép.
- Cấp quyền theo nguyên tắc least privilege.
- Kiểm tra object permission và table data permission.
- Gán `DataClassification` cho field lưu dữ liệu.
- Chỉ expose field cần thiết qua API Page, API Query, report hoặc XMLport.
- Kiểm tra quyền đọc, thêm, sửa, xóa và quyền chạy object.
- Tạo permission test khi feature có rủi ro phân quyền.
- Không đưa secret, token hoặc connection string vào AL.

## Khi mở rộng object chuẩn

Ưu tiên Table Extension, Page Extension, Report Extension, Permission Set Extension và event subscriber. Không sửa trực tiếp object chuẩn Microsoft.

## Khi chưa đủ thông tin

Không đoán security behavior. Ghi rõ assumption, xác định dữ liệu nhạy cảm và yêu cầu người dùng xác nhận role/permission trước khi triển khai.

# Các thành phần và object trong Business Central

## 1. Cách gọi chính xác

Trong Business Central hiện đại:

- Giao diện người dùng được xây dựng bằng **Page**. Từ `Form` thường thuộc cách gọi của các phiên bản NAV cũ hoặc nền tảng khác.
- **Report** không đồng nghĩa hoàn toàn với SSRS report. Report AL có thể dùng layout RDLC, Word, Excel hoặc các loại layout được nền tảng hỗ trợ.
- **Table** lưu dữ liệu và định nghĩa cấu trúc, field, key, relation và trigger liên quan.

## 2. Các object AL chính

| Object | Vai trò |
| --- | --- |
| **Table** | Lưu dữ liệu và định nghĩa cấu trúc dữ liệu. |
| **Page** | Hiển thị và cho phép người dùng thao tác với dữ liệu. Các dạng thường gặp gồm List, Card, Document, Role Center và API Page. |
| **Codeunit** | Chứa business logic, procedure, event publisher, event subscriber hoặc xử lý nền. |
| **Report** | Đọc, xử lý và xuất dữ liệu; có thể có request page và report layout. |
| **Query** | Truy vấn và kết hợp dữ liệu từ một hoặc nhiều table. |
| **XMLport** | Import hoặc export dữ liệu theo cấu trúc định nghĩa; thường dùng cho XML và các kịch bản trao đổi dữ liệu. |
| **Enum** | Định nghĩa tập giá trị có tên và kiểu an toàn. |
| **Interface** | Định nghĩa contract để nhiều codeunit hoặc object có thể triển khai các hành vi khác nhau. |
| **Control add-in** | Nhúng thành phần giao diện tùy chỉnh, thường kết hợp JavaScript hoặc HTML. |
| **Permission set** | Khai báo quyền truy cập object và dữ liệu cho người dùng hoặc nhóm người dùng. |
| **Profile** | Định nghĩa trải nghiệm làm việc theo vai trò, thường gắn với Role Center và navigation. |
| **Entitlement** | Định nghĩa quyền sử dụng extension hoặc tính năng trong các kịch bản được nền tảng hỗ trợ. |

## 3. Object extension

Extension dùng để mở rộng object hiện có mà không sửa trực tiếp object gốc của Microsoft.

| Extension | Dùng để |
| --- | --- |
| **Table extension** | Thêm field, key, field group hoặc logic phù hợp vào table hiện có. |
| **Page extension** | Thêm field, action, group hoặc thay đổi vị trí hiển thị trên page hiện có. |
| **Report extension** | Mở rộng dataset hoặc các phần được report cho phép mở rộng. |
| **Enum extension** | Thêm value vào enum hiện có khi enum cho phép mở rộng. |
| **Permission set extension** | Bổ sung quyền vào permission set hiện có. |
| **Profile extension** | Bổ sung hoặc điều chỉnh cấu hình profile hiện có. |
| **Page customization** | Tùy chỉnh page theo profile hoặc theo trải nghiệm người dùng cụ thể, trong phạm vi được hỗ trợ. |

## 4. Thành phần hỗ trợ thường gặp

Đây là các thành phần quan trọng trong một extension nhưng không phải tất cả đều là object AL nghiệp vụ:

- **Event subscriber**: lắng nghe event từ object khác để mở rộng hành vi.
- **Integration event**: event dành cho các điểm mở rộng hoặc tích hợp.
- **Business event**: biểu diễn một sự kiện nghiệp vụ có ý nghĩa với hệ thống khác.
- **Job queue**: lập lịch chạy report hoặc codeunit ở chế độ nền.
- **API Page và API Query**: cung cấp dữ liệu qua Business Central API.
- **Test codeunit**: chứa automated test; về bản chất vẫn là một codeunit có mục đích kiểm thử.
- **Test page**: biến hoặc cơ chế hỗ trợ kiểm thử page trong test codeunit, không nên nhầm với một nhóm page nghiệp vụ riêng.

## 5. File và cấu hình của extension

| Thành phần | Mục đích |
| --- | --- |
| `app.json` | Metadata của extension: tên, publisher, version, runtime, application, dependency và ID range. |
| File `.al` | Mã nguồn object AL. Có thể đặt nhiều object trong một file, nhưng nên tổ chức file theo feature để dễ bảo trì. |
| File `.xlf` | Bản dịch giao diện và caption. |
| Report layout | Layout RDLC, Word, Excel hoặc loại layout được hỗ trợ cho report. |
| `launch.json` | Cấu hình chạy và debug trong VS Code. |
| Permission set | Quyền cần thiết để người dùng sử dụng tính năng. |
| Dependency | Extension hoặc application package mà project cần để biên dịch và chạy. |

## 6. Ví dụ một feature hoàn chỉnh

Một feature thêm thông tin vào Customer thường có cấu trúc:

```text
TableExtension
  -> thêm field vào Customer

PageExtension
  -> hiển thị field trên Customer Card hoặc Customer List

Codeunit / Event Subscriber
  -> xử lý business logic hoặc phản ứng với event

Permission Set
  -> cấp quyền cần thiết nếu feature có object hoặc dữ liệu mới

Report Extension / Query
  -> đưa thông tin vào báo cáo hoặc tích hợp nếu cần
```

## 7. Checklist khi tạo thành phần mới

1. Xác định feature cần dữ liệu, giao diện, logic, báo cáo hay tích hợp nào.
2. Kiểm tra `app.json` để dùng đúng runtime, application version và ID range.
3. Ưu tiên `tableextension`, `pageextension` và event subscriber khi mở rộng object chuẩn.
4. Thiết kế key, relation, quyền truy cập và data classification phù hợp.
5. Kiểm tra ảnh hưởng hiệu năng, đặc biệt với query, report và xử lý số lượng bản ghi lớn.
6. Thêm test codeunit cho business logic quan trọng.
7. Biên dịch và kiểm tra warning trước khi xem feature là hoàn tất.

# Checklist theo loại object AL

Tài liệu này là checklist tra cứu nhanh. Chỉ đọc phần tương ứng với object đang phát triển.

## Table / Table Extension

- Field có data type, length và `DataClassification` phù hợp.
- Primary key phản ánh định danh thật.
- Secondary key có workload/filter cụ thể, không thêm theo phỏng đoán.
- Có `TableRelation`, validation và deletion behavior khi cần.
- Xem xét dữ liệu hiện có, multi-company và upgrade.

## Page / Page Extension

- Chọn đúng List, Card, Document, Worksheet, ListPart, Role Center hoặc API Page.
- Có `ApplicationArea` và source table phù hợp.
- Action, field và group đặt đúng vị trí.
- Không đặt business logic phức tạp trong page trigger.
- Kiểm tra load behavior, editable state và permissions.

## Codeunit

- Mỗi codeunit có trách nhiệm rõ ràng.
- Business logic không bị lặp trên nhiều page.
- Procedure visibility nhỏ nhất có thể.
- Event subscriber có filter và scope rõ ràng.
- Kiểm tra transaction, error handling, retry và idempotency.

## Report / Report Extension

- DataItem hierarchy đúng với quan hệ dữ liệu.
- Filter và dataset không lấy dư dữ liệu.
- FlowField được tính có chủ đích.
- Request page, layout, permissions và output được kiểm thử.

## Query / API

- DataItem link và filter đúng.
- Chỉ expose field cần thiết.
- Kiểm tra pagination, payload size và DataClassification.
- Không dùng query để thay thế business logic.

## XMLport

- Xác định import/export và schema.
- Kiểm tra encoding, mapping, validation và dữ liệu lỗi.
- Xem xét file lớn, retry và backward compatibility.

## Enum / Interface

- Tên value/contract ổn định và có ý nghĩa.
- Xác định extensible/non-extensible.
- Không thay đổi ordinal hoặc contract tùy tiện.
- Có test cho implementation và compatibility.

## Permission Set

- Chỉ cấp quyền cần thiết.
- Bao phủ đúng object và table data.
- Đồng bộ với feature và test permission khi cần.

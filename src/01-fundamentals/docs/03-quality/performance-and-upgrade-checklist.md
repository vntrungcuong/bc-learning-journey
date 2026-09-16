# Checklist Performance và Upgrade

## Performance

- Kiểm tra số lần truy cập database và database call trong loop.
- Dùng filter có selectivity và key phù hợp với workload thực tế.
- Dùng `FindSet`, `SetLoadFields` và `CalcFields` có chủ đích.
- Đánh giá FlowField, page trigger, report dataset/layout, API payload và AI payload.
- Không thêm key, LockTable, cache hoặc batch processing nếu chưa nêu trade-off.
- Ghi workload, data volume, concurrency, baseline, metric, percentile, target và cách đo trước/sau.
- Không áp dụng SLA một giây cho mọi workflow; target phải phù hợp page, API, report, Job Queue, integration hoặc upgrade.

## Upgrade

- Kiểm tra thay đổi field, key, relation, enum value và schema.
- Xác định dữ liệu cũ cần migration hay default value.
- Kiểm tra dependency và application compatibility.
- Xem xét backward compatibility của API, XMLport, interface và event.
- Tạo upgrade test khi thay đổi schema hoặc dữ liệu.
- Báo cáo assumption và phần chưa thể xác minh.

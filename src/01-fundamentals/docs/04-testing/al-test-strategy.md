# Chiến lược test AL

## Test tối thiểu

Mỗi feature cần xác định:

- Positive path.
- Invalid input và error behavior.
- Boundary và empty data.
- Duplicate/retry nếu có xử lý lặp.
- Permission và data exposure nếu có.
- Upgrade/migration nếu thay đổi schema.

## Nguyên tắc

- Dùng Arrange, Act, Assert.
- Test behavior, không khóa chặt implementation detail.
- Dữ liệu test deterministic và isolated.
- Test không phụ thuộc thứ tự chạy.
- Tên test mô tả behavior và expected result.
- Không dùng dữ liệu thật hoặc secret.

## Validation

Sau khi tạo test:

1. Chạy focused test cho feature.
2. Chạy compile/diagnostics.
3. Kiểm tra test failure có phản ánh lỗi production hay lỗi setup.
4. Báo cáo test gap và residual risk nếu môi trường không đủ để chạy test.

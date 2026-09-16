# BC Test Framework Patterns

## Patterns cần cân nhắc

- Test Codeunit với `[Test]` cho business behavior.
- `[TestPermissions]` cho permission behavior khi phù hợp.
- `TestPage` cho page field/action behavior.
- `TestRequestPage` cho request page và report filters.
- Report output/dataset/layout verification khi report là contract người dùng.
- API/XMLport harness cho mapping, validation và error behavior.
- Integration tests cho timeout, retry, duplicate, idempotency và partial failure.
- Upgrade tests cho schema/data migration.

## Nguyên tắc

- Test độc lập thứ tự chạy và rollback/cleanup đúng.
- Dữ liệu deterministic, tối thiểu và không dùng secret.
- Test behavior thay vì implementation detail.
- Ghi rõ command/environment để chạy test.
- Khi không thể chạy test, báo cáo limitation và risk.

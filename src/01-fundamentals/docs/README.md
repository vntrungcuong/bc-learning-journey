# Tài liệu Business Central và AL

Thư mục này lưu các ghi chú học tập và tra cứu nhanh cho project `01-fundamentals`.

## Bối cảnh project

- Business Central application: `28.0.0.0`
- AL runtime: `17.1`
- Target: `Cloud`
- Object ID range: `50100-50149`

## Nội dung

| Nhóm | Tài liệu | Nội dung |
| --- | --- | --- |
| Nền tảng | [Các thành phần và object AL](01-fundamentals/business-central-al-objects-overview.md) | Phân loại object chính, object mở rộng và các thành phần hỗ trợ |

| Hướng dẫn phát triển | [Checklist object AL](02-development-guidelines/al-object-checklists.md) | Checklist ngắn theo từng loại object |
| Hướng dẫn phát triển | [Naming và phân bổ ID](02-development-guidelines/naming-and-id-allocation.md) | Quy tắc đặt tên, prefix và ID |
| Hướng dẫn phát triển | [Official source verification](02-development-guidelines/official-source-verification.md) | Xác minh API, symbols và version compatibility |
| Hướng dẫn phát triển | [AL maintainability principles](02-development-guidelines/al-maintainability-principles.md) | KISS, DRY, SOLID thực dụng và documentation |
| Chất lượng | [Security, permission và DataClassification](03-quality/security-permissions-and-data-classification.md) | Kiểm tra bảo mật và quyền |
| Chất lượng | [Performance và upgrade](03-quality/performance-and-upgrade-checklist.md) | Checklist hiệu năng và nâng cấp |
| Chất lượng | [Integration checklist](03-quality/integration-checklist.md) | Checklist tích hợp và recovery |
| Chất lượng | [AI và UX](03-quality/ai-and-user-experience-guidelines.md) | AI safeguards và trải nghiệm người dùng |
| Chất lượng | [Performance budgets](03-quality/performance-budgets.md) | Baseline, workload, metric và target |
| Kiểm thử | [Chiến lược test AL](04-testing/al-test-strategy.md) | Cách thiết kế test cho feature AL |
| Kiểm thử | [BC test framework patterns](04-testing/bc-test-framework-patterns.md) | TestPage, TestRequestPage, permission và upgrade tests |

## Nguyên tắc sử dụng

- Ưu tiên event subscriber và object extension khi mở rộng chức năng chuẩn.
- Không sửa trực tiếp object chuẩn của Microsoft.
- Kiểm tra `app.json` trước khi tạo object mới để bảo đảm đúng runtime, dependency và ID range.
- Khi ghi chú có ví dụ phụ thuộc version, cần kiểm tra lại với tài liệu Microsoft Learn tương ứng.

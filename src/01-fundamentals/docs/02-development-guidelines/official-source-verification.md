# Official Source Verification

## Mục tiêu

Đảm bảo thông tin và code AL được kiểm tra theo nguồn chính thống, đúng với runtime/application version của project.

## Quy tắc

- Đọc `app.json` trước khi đề xuất API, property, event, object, dependency hoặc syntax.
- Kiểm tra AL symbols hiện có trong môi trường phát triển khi có thể.
- Đối chiếu Microsoft Learn hoặc tài liệu Microsoft chính thức tương ứng.
- Ghi rõ version/context của nguồn khi behavior phụ thuộc version.
- Không tự bịa method, event, property, object name, permission hoặc endpoint.
- Nếu không thể kiểm tra external source hoặc symbols, phải ghi rõ limitation và không trình bày assumption như fact.

## Output tối thiểu

- Verified facts.
- Source or symbol evidence.
- Assumptions.
- Unverified items.
- Compatibility risk.

Nguồn tham khảo chính nên ưu tiên Microsoft Learn, tài liệu AL language/reference và symbols của đúng Business Central environment.

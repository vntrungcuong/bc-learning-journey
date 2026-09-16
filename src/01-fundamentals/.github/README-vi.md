# Hướng dẫn sử dụng GitHub Copilot cho Business Central

Tài liệu này mô tả cách sử dụng bộ instructions, prompts và skills trong các dự án Microsoft Dynamics 365 Business Central (BC) với AL.

## 1. Cấu trúc instructions

### Personal instructions

Personal instructions nằm trong thư mục prompts của VS Code User Profile, ví dụ:

```text
C:\Users\<user>\AppData\Roaming\Code\User\prompts\bc-senior-consultant.instructions.md
```

Chúng áp dụng cho các dự án BC của cá nhân và chứa các nguyên tắc dùng chung:

- Vai trò Senior Technical Consultant.
- Ngôn ngữ phản hồi theo ngôn ngữ input.
- Ưu tiên correctness, security, performance, maintainability và upgrade safety.
- Không sửa trực tiếp Base Application hoặc System Application.
- Ưu tiên extension patterns, event subscribers và AL-native patterns.

Không đặt thông tin riêng của project như publisher, object ID range, tenant hoặc business rules vào personal instructions.

### Repository instructions

Mỗi repository BC nên có:

```text
.github/
├── copilot-instructions.md
├── instructions/
│   ├── al-code.instructions.md
│   ├── al-tests.instructions.md
│   └── documentation.instructions.md
├── prompts/
│   ├── design-al-object.prompt.md
│   ├── develop-al-feature.prompt.md
│   ├── test-al-feature.prompt.md
│   ├── review-al-security-upgrade.prompt.md
│   ├── review-al-code.prompt.md
│   └── review-performance.prompt.md
└── skills/
    ├── bc-al-feature-development/
    │   └── SKILL.md
    └── bc-performance-review/
        └── SKILL.md
```

File `.github/copilot-instructions.md` chứa context và quy tắc riêng của repository, chẳng hạn:

- Runtime, application version và target.
- Publisher và object ID ranges.
- Dependencies và source of truth là `app.json`.
- Quy tắc build, validation và cấu trúc project.

Các file trong `.github/instructions/` là file-scoped instructions, được áp dụng theo loại file thông qua `applyTo`:

- `**/*.al`: quy tắc viết và review AL.
- `**/*Test*.al`: quy tắc viết test AL.
- `**/*.md`: quy tắc viết tài liệu.

Prompts dùng cho task cụ thể như code review hoặc performance review. Skills dùng cho workflow nhiều bước, ví dụ đánh giá performance toàn diện.

Các prompt phát triển AL:

- `design-al-object.prompt.md`: thiết kế một object hoặc object extension trước khi viết code.
- `develop-al-feature.prompt.md`: lập plan và triển khai feature có nhiều object.
- `test-al-feature.prompt.md`: thiết kế hoặc tạo test cho feature.
- `review-al-security-upgrade.prompt.md`: review permission, data exposure, schema và upgrade impact.

Skill `bc-al-feature-development` dùng cho workflow nhiều bước. Skill này chỉ đọc tài liệu liên quan trực tiếp đến feature, không nạp toàn bộ `docs/` để giảm context và AI credits.

## 2. Lộ trình sử dụng theo use case

### Phát triển tính năng

1. Đọc `app.json` và xác định business requirement.
2. Yêu cầu Copilot lập plan nếu tính năng liên quan đến nhiều object, schema, permission hoặc integration.
3. Thiết kế table, relations, keys, pages, codeunits và events.
4. Implement theo từng phần nhỏ, ưu tiên extension patterns.
5. Compile, review diff và chạy test tập trung.
6. Kiểm tra permission, performance, upgrade impact và residual risks.

Prompt mẫu:

```text
Hãy lập implementation plan cho tính năng này trước. Bao gồm data model, objects, permissions, events, upgrade impact, tests và validation steps. Chưa sửa file.
```

### Tìm nguyên nhân và sửa lỗi

1. Mô tả behavior thực tế và behavior mong đợi.
2. Cung cấp error message, stack trace, environment và bước tái hiện.
3. Yêu cầu Copilot phân loại lỗi: compile-time, runtime, data, permission, integration hoặc performance.
4. Yêu cầu một hypothesis có thể kiểm chứng và diagnostic check rẻ nhất.
5. Sửa root cause với phạm vi nhỏ nhất.
6. Compile và chạy lại đúng scenario đã lỗi.

Prompt mẫu:

```text
Hãy phân tích lỗi này theo workflow: behavior thực tế, root cause hypothesis, diagnostic check, focused fix và validation. Không refactor rộng khi chưa xác định root cause.
```

### Review và cải thiện performance

Review nhỏ có thể dùng `review-performance.prompt.md`. Với feature nhiều lớp, dùng `bc-performance-review` skill.

Quy trình nên bao gồm:

- Database calls, filters, keys, loops và FlowFields.
- `FindSet`, `SetLoadFields`, `CalcFields` và record loading.
- Page triggers, report dataset, API pagination và payload size.
- Transaction scope, locking, concurrency và external calls.
- Job Queue, retry, duplicate processing và telemetry.
- Cách đo trước/sau thay đổi.

Không kết luận một thay đổi nhanh hơn nếu chưa nêu bottleneck, behavior cần giữ nguyên và phương pháp đo.

### Code review và các use case khác

- **Code review:** dùng `review-al-code.prompt.md`, yêu cầu findings-first theo severity, file/line, impact, recommendation và test scenario.
- **Tạo table/page:** yêu cầu thiết kế data type, relations, keys, DataClassification, UX, permissions và upgrade impact trước khi sinh code.
- **Integration:** phân tích sync/async, authentication, idempotency, retry, timeout, correlation ID, staging và error handling trước khi implement.
- **Test:** áp dụng `al-tests.instructions.md`, bao gồm positive, negative, boundary, permission, concurrency và upgrade scenarios khi phù hợp.
- **Documentation:** áp dụng `documentation.instructions.md`, ghi rõ prerequisites, configuration, usage, limitations và validation.

## 3. Giải thích vị trí file

`.github/copilot-instructions.md` **không bị thiếu**. File này nằm ở thư mục `.github/` và là repository-level instruction, áp dụng cho toàn bộ repository.

Thư mục `.github/instructions/` chỉ dành cho các file instructions có phạm vi cụ thể và thường có frontmatter `applyTo`. Vì vậy không cần đặt thêm một bản `copilot-instructions.md` bên trong `.github/instructions/`; làm như vậy sẽ gây trùng lặp và khó bảo trì.

Quy tắc phân chia:

| Thành phần | Mục đích |
| --- | --- |
| Personal instruction | Nguyên tắc BC dùng chung cho cá nhân |
| `.github/copilot-instructions.md` | Context và quy tắc riêng của repository |
| `.github/instructions/` | Quy tắc theo loại file |
| `.github/prompts/` | Workflow gọi thủ công cho task cụ thể |
| `.github/skills/` | Workflow nhiều bước, chuyên sâu |

Sau khi thay đổi customization, chạy `Developer: Reload Window` để VS Code nạp lại cấu hình.

## 4. Prompt templates và examples

Các template dưới đây chỉ bổ sung yêu cầu cho từng task; chúng kế thừa personal instructions, repository instructions và file-scoped instructions. Thay phần trong dấu `<...>` trước khi gửi cho Copilot.

### 4.1 Prompt templates

#### Prompt nền cho mọi task

```text
Task: <mô tả task>

Trước khi thực hiện:
- Làm rõ behavior hiện tại, behavior mong đợi và assumptions.
- Nếu task lớn, trình bày plan và files dự kiến thay đổi trước; chưa sửa file.

Sau khi thực hiện:
- Báo cáo files changed, validation đã chạy và risks còn lại.
```

#### Tạo folder và cấu trúc feature

```text
Hãy thiết kế cấu trúc folder cho feature <tên feature> trong repository Business Central này.

Trước khi tạo folder/file:
1. Đọc cấu trúc repository hiện tại và app.json.
2. Đề xuất các folder và mục đích của từng folder.
3. Xác định object types cần có: table, page, codeunit, report, query, API, permission set và test.
4. Giữ cấu trúc đơn giản, phù hợp với convention hiện tại và thuận tiện cho maintain.
5. Không tạo file placeholder hoặc folder không có mục đích rõ ràng.

Sau khi tôi xác nhận, hãy tạo cấu trúc và báo cáo danh sách file đã tạo.
```

#### Phát triển feature mới

```text
Hãy phân tích và triển khai feature <tên feature> cho Business Central.

Giai đoạn 1 - chưa sửa file:
- Tóm tắt business behavior và assumptions.
- Đề xuất data model, objects, events, pages, permissions và dependencies.
- Phân tích performance, security, upgrade impact và test scenarios.
- Tạo implementation plan theo các bước nhỏ.

Giai đoạn 2 - chỉ thực hiện sau khi plan rõ:
- Implement từng bước, ưu tiên extension patterns và event subscribers.
- Compile và chạy focused validation sau mỗi slice.
- Cuối cùng báo cáo files changed, tests, validation và residual risks.
```

#### Template: tìm nguyên nhân và sửa lỗi

```text
Hãy điều tra lỗi Business Central sau:

Actual behavior: <behavior thực tế>
Expected behavior: <behavior mong đợi>
Error/stack trace: <error hoặc stack trace>
Environment: <sandbox/on-premises/production, runtime nếu biết>
Reproduction steps: <các bước tái hiện>

Workflow bắt buộc:
1. Phân loại lỗi: compile-time, runtime, data, permission, integration hoặc performance.
2. Xác định code path và phân biệt custom object với standard Microsoft object.
3. Nêu một root-cause hypothesis có thể kiểm chứng.
4. Đề xuất diagnostic check rẻ nhất để xác nhận hoặc bác bỏ hypothesis.
5. Chỉ sau đó đề xuất focused fix, không refactor rộng.
6. Chạy compile/test hoặc nêu rõ check nào chưa thể chạy.
7. Báo cáo root cause, files changed, validation và risks còn lại.
```

#### Review và tối ưu performance

```text
Hãy thực hiện performance review cho feature/object <tên feature hoặc file>.

Phân tích:
- Database calls, filters, filter selectivity, keys và sorting.
- FindSet, SetLoadFields, CalcFields, FlowFields và record loading.
- Database calls trong loops.
- Page triggers, report dataset, API pagination và payload size.
- Transaction scope, locking, concurrency và external calls.
- Job Queue, retry, duplicate processing và telemetry.

Với mỗi finding, cung cấp:
- Severity và vị trí file/dòng.
- Bottleneck nghi ngờ và evidence hiện có.
- Expected impact.
- Recommendation nhỏ nhất có thể.
- Behavior cần giữ nguyên.
- Storage/write cost, locking/transaction trade-off.
- Cách đo trước và sau thay đổi.

Không thêm key, cache, batching hoặc LockTable nếu chưa giải thích correctness và trade-offs. Không khẳng định performance cải thiện nếu chưa có measurement plan.
```

#### Review code

```text
Báo cáo findings trước summary, sắp xếp theo severity: Critical, High, Medium, Low.
Kiểm tra:
- Functional defects và business behavior.
- Event subscriber và extensibility.
- Permissions, DataClassification và security exposure.
- Tables, relations, keys và data types.
- Database access, loops, transaction và locking.
- AL-native error handling và translatable labels.
- Upgrade, dependency và runtime compatibility.
- Test coverage và observability.

Mỗi finding phải có: file/line, problem, impact, recommendation và validation/test scenario.
Nếu không có finding, nói rõ điều đó và liệt kê test gaps hoặc residual risks.
```

#### Thiết kế table

```text
Hãy thiết kế table AL cho <business entity>.

Trước khi sinh code, đề xuất:
- Fields, IDs, data types, lengths và DataClassification.
- Primary key và secondary keys; giải thích lý do từng key.
- TableRelation, validation và deletion behavior.
- Expected data volume, filter/sort scenarios và multi-company behavior.
- Audit fields, upgrade impact và integration exposure.
- Permissions và focused tests.

Không thêm key chỉ vì field có thể được filter. Chọn data type nhỏ nhất nhưng vẫn đáp ứng domain và khả năng mở rộng. Sau khi thiết kế được xác nhận, tạo AL code theo project conventions.
```

#### Thiết kế page/form

```text
Hãy thiết kế page/form cho workflow <mô tả user workflow>.

Đề xuất trước:
- Page type phù hợp: List, Card, Document, Worksheet, ListPart, API hoặc loại khác.
- User role và task chính.
- Fields cần hiển thị, fields không cần hiển thị và grouping.
- Actions, promoted actions, ApplicationArea, Importance, Visible và Editable.
- Lookup, validation, filters và navigation.
- UX/accessibility và page trigger performance.
- Permissions, test scenarios và upgrade impact.

Không đặt business logic phức tạp trong page trigger; chuyển logic phù hợp sang codeunit. Sau khi plan được xác nhận, tạo page theo standard BC patterns.
```

#### Thiết kế integration

```text
Hãy thiết kế integration giữa Business Central và <external system>.

Phân tích trước:
- Source/target và ownership của data.
- Synchronous hay asynchronous.
- Authentication, secret handling và permissions.
- Contract, versioning, pagination và payload limits.
- Idempotency, duplicate protection, retry, timeout và rate limits.
- Staging, correlation ID, logging, monitoring và error handling.
- Job Queue, partial failure, dead-letter hoặc retry strategy.
- Transaction scope; không giữ transaction mở trong lúc gọi HTTP nếu không cần.

Đề xuất architecture, objects, data flow, failure scenarios và test plan trước khi viết code.
```

#### Tạo test

```text
Hãy đề xuất và tạo AL tests cho <feature/object>.

Bao gồm khi phù hợp:
- Positive và negative scenarios.
- Boundary values và validation errors.
- Permissions và unauthorized access.
- Duplicate processing, retry và integration failures.
- Concurrency/locking behavior.
- Upgrade hoặc data migration behavior.

Giữ test deterministic, isolated và không phụ thuộc execution order. Sử dụng Arrange, Act, Assert; test business behavior thay vì implementation details. Báo cáo các scenario chưa thể tự động hóa.
```

#### Tạo documentation

```text
Hãy viết documentation cho <feature/object/integration> bằng <Vietnamese/English>.

Bao gồm ngắn gọn:
- Purpose và business scope.
- Prerequisites và dependencies.
- Configuration và permissions.
- Usage hoặc operational flow.
- Error handling và troubleshooting.
- Performance considerations.
- Upgrade/migration impact.
- Limitations, validation và test evidence.

Chỉ mô tả behavior đã được kiểm chứng; ghi rõ assumptions hoặc phần chưa validate. Dùng heading, bảng và code block Markdown dễ đọc.
```

### 4.2 Ví dụ prompt theo từng use case

#### Ví dụ: tạo folder và cấu trúc feature

```text
Hãy thiết kế cấu trúc folder cho feature Customer Credit Review.

Feature cần lưu lịch sử đánh giá hạn mức tín dụng của Customer, hiển thị lịch sử trên một page riêng và chạy review thủ công từ Customer Card.

Hãy đề xuất folder, table, page, codeunit, permission set và test object cần có. Chưa tạo file; sau khi tôi xác nhận plan mới tạo cấu trúc.
```

#### Ví dụ: phát triển feature mới

```text
Hãy phân tích và triển khai feature Customer Credit Review.

Khi người dùng chạy action trên Customer Card, hệ thống tạo một bản ghi review gồm Customer No., review date, credit limit, current balance, reviewer và status. Người dùng có thể xem lịch sử review nhưng không được sửa các review đã hoàn tất.

Hãy lập plan trước, bao gồm data model, objects, action, permissions, validation, upgrade impact và AL tests. Chưa sửa file ở phase đầu.
```

#### Ví dụ: tìm nguyên nhân và sửa lỗi

```text
Hãy điều tra lỗi khi mở Customer List, người dùng thấy message "App published" xuất hiện nhiều lần và page load chậm.

Actual behavior: message xuất hiện mỗi lần page được mở hoặc refresh.
Expected behavior: không hiển thị message trong production behavior; page mở trong thời gian bình thường.
Reproduction steps: mở Customers, refresh browser, chuyển sang customer khác rồi quay lại.

Hãy xác định code path của page triggers, nêu một root-cause hypothesis, đề xuất diagnostic check rẻ nhất và focused fix. Không refactor rộng trước khi xác định nguyên nhân.
```

#### Ví dụ: review và tối ưu performance

```text
Hãy review performance của codeunit Customer Credit Review.

Procedure hiện tại duyệt toàn bộ Customer Ledger Entry trong một vòng lặp, gọi CalcFields cho từng record và thực hiện Modify sau mỗi lần tính toán. Dữ liệu dự kiến khoảng 5 triệu ledger entries.

Hãy kiểm tra filters, keys, FindSet, FlowFields, SetLoadFields, database calls trong loop, transaction scope và locking. Đề xuất cải thiện kèm trade-off, behavior cần giữ nguyên và cách đo thời gian xử lý trước/sau.
```

#### Ví dụ: code review

````text
Hãy review đoạn AL code sau theo format findings-first:

```al
Customer.SetRange("Blocked", Customer."Blocked"::" ");
if Customer.FindSet() then
    repeat
        Customer.CalcFields("Balance (LCY)");
        if Customer."Balance (LCY)" > 10000 then
            Customer.Modify();
    until Customer.Next() = 0;
```

Tập trung vào correctness, filter, FlowField, Modify không cần thiết, transaction, performance và test scenario. Mỗi finding cần severity, file/line giả định, impact và recommendation.
````

#### Ví dụ: thiết kế table

```text
Hãy thiết kế table Customer Credit Review.

Table cần lưu nhiều review cho một Customer. Các trường nghiệp vụ gồm Customer No., Review Date, Credit Limit, Balance at Review, Reviewer User ID, Status và Comments.

Hãy đề xuất data types, primary key, secondary keys cần thiết, TableRelation tới Customer, DataClassification, deletion behavior, expected data volume, permissions và upgrade risks. Không thêm key nếu chưa có filter hoặc sorting scenario rõ ràng.
```

#### Ví dụ: thiết kế page/form

```text
Hãy thiết kế một List page và một Card page cho Customer Credit Review.

Người dùng cần lọc theo Customer, Status và Review Date; xem review đã hoàn tất ở chế độ chỉ đọc; tạo review mới từ Customer Card; và không sửa được Review Date hoặc Reviewer sau khi status là Completed.

Hãy đề xuất page types, fields, actions, filters, ApplicationArea, Editable/Enabled behavior, validation, permissions và rủi ro performance của page triggers trước khi tạo code.
```

#### Ví dụ: thiết kế integration

```text
Hãy thiết kế integration gửi Customer Credit Review đã hoàn tất sang hệ thống Credit Risk qua REST API.

Chỉ review có status Completed mới được gửi. Integration phải retry khi timeout hoặc HTTP 5xx, không gửi trùng cùng một Review ID, lưu correlation ID và cho phép Job Queue xử lý lại record lỗi.

Hãy đề xuất synchronous/asynchronous flow, staging hoặc integration status, authentication, idempotency key, retry policy, timeout, error logging, permissions, transaction boundaries và test scenarios trước khi viết AL code.
```

#### Ví dụ: tạo test

```text
Hãy tạo AL tests cho Customer Credit Review.

Các behavior cần kiểm tra:
- Tạo review cho Customer hợp lệ.
- Không cho tạo review nếu Customer không tồn tại.
- Không sửa Review Date khi review đã Completed.
- Chỉ review Completed mới được đưa vào integration queue.
- Cùng một Review ID không được enqueue hai lần.
- Người dùng thiếu permission không được tạo hoặc sửa review.

Tổ chức test theo Arrange, Act, Assert và báo cáo các scenario chưa thể tự động hóa.
```

#### Ví dụ: tạo documentation

```text
Hãy viết tài liệu tiếng Việt cho feature Customer Credit Review.

Tài liệu cần có: mục đích, user workflow, cấu hình, permissions, status lifecycle, cách chạy integration, retry/error handling, giới hạn dữ liệu, performance considerations, upgrade impact và test evidence.

Chỉ mô tả behavior đã được kiểm chứng từ code và cấu hình hiện tại; đánh dấu rõ assumptions hoặc phần chưa validate.
```

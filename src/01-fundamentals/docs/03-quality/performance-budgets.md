# Performance Budgets

Performance target phải gắn với workflow, workload và environment cụ thể.

## Cần xác định

- Workflow: page, API, report, integration, Job Queue, posting hoặc upgrade.
- Dataset/data volume và tốc độ tăng trưởng.
- Số user/concurrency.
- Cold/warm execution.
- Metric: duration, throughput, error rate, database calls hoặc payload size.
- Percentile: average, p95 hoặc p99.
- Baseline, target và measurement method.

Không dùng một con số chung cho mọi nghiệp vụ. Khi chưa có measurement, chỉ đưa ra hypothesis và kế hoạch đo.

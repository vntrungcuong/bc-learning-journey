# Integration Checklist

- Contract, direction, API version và compatibility đã rõ.
- Authentication, secret handling và outbound HTTP configuration an toàn.
- Permission Set và data exposure đúng least privilege.
- Timeout, rate limit, retry/backoff và retry exhaustion được định nghĩa.
- Idempotency, duplicate delivery và replay/manual recovery được xử lý.
- External call không giữ database transaction lâu hơn cần thiết.
- Correlation ID, telemetry và sensitive-data scrubbing đã có.
- Job Queue schedule, failure state và operational ownership đã rõ.
- Tests bao phủ success, invalid response, timeout, auth failure, duplicate, retry và partial failure.
- API signature và behavior đã verify bằng official source hoặc provider documentation.

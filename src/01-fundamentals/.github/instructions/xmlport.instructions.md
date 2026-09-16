---
description: XMLport import/export rules
applyTo: "**/XmlPorts/**/*.al,**/XMLPorts/**/*.al,**/*.XmlPort.al"
---

# XMLport import/export rules

- Define format, encoding, field mapping, validation, and error behavior explicitly.
- Validate imported data before committing business changes.
- Do not silently ignore malformed or required values.
- Keep parsing/transport separate from reusable business logic where practical.
- Consider large-file memory, transaction, and recovery behavior.

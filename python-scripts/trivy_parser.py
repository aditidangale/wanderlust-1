import json
import sys

if len(sys.argv) < 2:
    print("Usage: python trivy_parser.py <report.json>")
    sys.exit(1)

file_path = sys.argv[1]

with open(file_path) as f:
    data = json.load(f)

critical_count = 0

for result in data.get("Results", []):
    for vuln in result.get("Vulnerabilities", []):
        if vuln.get("Severity") == "CRITICAL":
            critical_count += 1

print(f"Critical Vulnerabilities: {critical_count}")

if critical_count > 0:
    print("❌ Build Failed due to Critical Vulnerabilities")
    sys.exit(1)
else:
    print("✅ No Critical Vulnerabilities")

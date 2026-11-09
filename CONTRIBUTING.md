# Contributing

Thanks for helping improve OpenBot. Keep changes focused, preserve third-party license notices, and use original artwork or assets with clear reuse rights.

Before opening a pull request, run:

```bash
npm ci
npm run typecheck
npm run build
bash scripts/check-marks.sh
```

Please describe the user-facing change and any provider setup needed. Do not include secrets, user data, or generated build output in commits.

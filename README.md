# OpenBot

OpenBot gives you always-on AI teammates. Each teammate has its own cloud computer, connected apps, routines, group chats, long-term memory, and voice. You run the open-source application with your own provider keys.

## What it can do

- Create teammates with their own roles, instructions, skills, and memory.
- Let them work in a cloud desktop, browser, and shell, with a live viewer and approval prompts for app actions.
- Connect apps, schedule routines, respond to app events, and collaborate through group chats and delegated work.
- Keep durable conversation history and memory, and talk with teammates by voice.

## Quick start

Requires Node.js 22 or newer. Provider keys are optional individually; features that need an unconfigured provider will be unavailable.

```bash
git clone https://github.com/brian-porter/openbot.git
cd openbot
cp .env.example .env
# Edit .env and add the provider keys/features you want to use.
npm ci
npm run dev -w @openbot/server
npm run dev -w @openbot/web
```

Open http://localhost:5173. For local testing, set `DEV_LOGIN=1` and use the email form. Production builds with `npm run build` and starts with `npm start`. Set `APP_URL`, `SERVER_URL`, and a strong `SESSION_SECRET` for a hosted deployment. Never commit `.env`.

## Bring your own providers

Each integration is optional and uses your own account and keys:

- **Model:** xAI is the default model provider (`XAI_API_KEY`, optional `XAI_MODEL`; default `grok-4.7`). Voice uses xAI models as well.
- **Cloud computer:** Orgo provides remote desktops (`ORGO_API_KEY`, `ORGO_WORKSPACE_ID`).
- **Apps:** Composio provides connected apps and app events (`COMPOSIO_API_KEY`).

Set only the credentials for services you choose to use. See [provider configuration](docs/model-and-app-providers.md), [cloud computer guide](docs/orgo-builder-guide.md), and [architecture](docs/ARCHITECTURE.md).

## Join the AO collective

OpenBot is the open-source on-ramp to AO, the cooperative of account owners building on AO. Account owners get the hosted version, AObot, with managed cloud computers for their agents. Learn more at [acrobi.com/ao](https://acrobi.com/ao). Contributions are welcome; start with [CONTRIBUTING.md](CONTRIBUTING.md).

## Credits

OpenBot is derived from [Nick Vasilescu's grokbot-clone](https://github.com/nickvasilescu/grokbot-clone) at commit `9e21ecdd`, under the MIT License. See [LICENSE](LICENSE) and [NOTICE.md](NOTICE.md).

## Disclaimer

OpenBot is not affiliated with or endorsed by xAI. Product and service names belong to their respective owners.

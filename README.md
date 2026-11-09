# OpenBot

OpenBot gives you always-on AI teammates. Each teammate has its own cloud computer, connected apps, routines, group chats, long-term memory, and voice. You run the open-source application with your own provider keys.

## What it can do

- Create teammates with their own roles, instructions, skills, and memory.
- Let them work in a cloud desktop, browser, and shell, with a live viewer and approval prompts for app actions.
- Connect apps, schedule routines, respond to app events, and collaborate through group chats and delegated work.
- Keep durable conversation history and memory, and talk with teammates by voice.

## Quick start

Requires Node.js 22 or newer. Today the server needs all four of `XAI_API_KEY`, `ORGO_API_KEY`, `COMPOSIO_API_KEY` and `SESSION_SECRET` at startup (see `server/src/env.ts`); making each provider optional is on the roadmap.

```bash
git clone https://github.com/brian-porter/openbot.git
cd openbot
cp .env.example .env
# Edit .env and add your provider keys.
npm ci
npm run dev -w @openbot/server
npm run dev -w @openbot/web
```

Open http://localhost:5173. For local testing, set `DEV_LOGIN=1` and use the email form. Production builds with `npm run build` and starts with `npm start`. Set `APP_URL`, `SERVER_URL`, and a strong `SESSION_SECRET` for a hosted deployment. Never commit `.env`.

## Bring your own providers

Each integration uses your own account and keys:

- **Model:** xAI is the default model provider (`XAI_API_KEY`, optional `XAI_MODEL`; default `grok-4.7`). Voice uses xAI models as well.
- **Cloud computer:** Orgo provides remote desktops (`ORGO_API_KEY`, `ORGO_WORKSPACE_ID`).
- **Apps:** Composio provides connected apps and app events (`COMPOSIO_API_KEY`).

See [provider configuration](docs/model-and-app-providers.md), [cloud computer guide](docs/orgo-builder-guide.md), and [architecture](docs/ARCHITECTURE.md).

## Join the AO collective

OpenBot is the open-source on-ramp to AO, a cooperative of account owners building on AO. We are building a hosted version for AO account owners, AObot, which will run agents' work on managed cloud computers. Contributions are welcome; start with [CONTRIBUTING.md](CONTRIBUTING.md).

## Credits

OpenBot is derived from [Nick Vasilescu's grokbot-clone](https://github.com/nickvasilescu/grokbot-clone) at commit `9e21ecdd`, under the MIT License. See [LICENSE](LICENSE) and [NOTICE.md](NOTICE.md).

## Disclaimer

OpenBot is not affiliated with or endorsed by xAI. Product and service names belong to their respective owners.

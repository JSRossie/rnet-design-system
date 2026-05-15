# Font Hosting — cdn.rossie.net

Self-hosted JetBrainsMono Nerd Font for the JR / R—Net design system. Replaces the
old `cdn.jsdelivr.net @v3.2.1` dependency.

## What's in this folder

| File | Purpose |
|------|---------|
| `JetBrainsMonoNerdFont-Regular.ttf` / `-Medium.ttf` | Source fonts, Nerd Fonts v3.4.0. Kept for re-conversion; **not** deployed. |
| `jetbrains-mono-nerd-regular.woff2` / `-medium.woff2` | Production webfonts (woff2, ~988 KB each — 59% smaller than the ttf). |
| `cloudflare-deploy/` | **The exact folder to upload to Cloudflare Pages.** Contains `index.html`, `_headers`, and `fonts/*.woff2`. |
| `HOSTING.md` | This file. |

The production `@font-face` in `reference/style-guide.html` already points at:
`https://cdn.rossie.net/fonts/jetbrains-mono-nerd-{regular,medium}.woff2`

## Cloudflare Pages setup (JR — dashboard work)

You already host a site (`rossie.net` / `www.rossie.net`) on Pages. Use a **separate
Pages project** for CDN assets so font files never tangle with your main site.

1. **Create the project.** Cloudflare dashboard → **Workers & Pages** → **Create** →
   **Pages** → **Upload assets** (not "Connect to Git").
2. **Name it** `cdn-rossie` (the name only affects the temporary `*.pages.dev` URL).
3. **Upload.** Drag the **contents** of `fonts/cloudflare-deploy/` into the upload box —
   i.e. select `index.html`, `_headers`, and the `fonts/` folder together. Do *not* drag
   the `cloudflare-deploy` folder itself, or files land one level too deep.
4. Click **Deploy site**. You'll get a `cdn-rossie.pages.dev` URL — test it works.
5. **Custom domain.** Open the project → **Custom domains** → **Set up a custom domain**
   → enter `cdn.rossie.net`. Since `rossie.net` is already on Cloudflare, it auto-creates
   the CNAME record. Wait for the status to go **Active** (usually < 1 min).

## Verify it worked

After `cdn.rossie.net` is Active, in a terminal:

```
curl -sI https://cdn.rossie.net/fonts/jetbrains-mono-nerd-regular.woff2
```

Expect `HTTP/2 200`, `content-type: font/woff2`, and
`access-control-allow-origin: *` (the `_headers` file sets the CORS header — required
because `style-guide.html` loads the font from a different origin).

Then open `reference/style-guide.html` in a browser — glyphs should render, not boxes.

## Updating the font later

To pick up a newer Nerd Fonts release: download the new `JetBrainsMono.zip`, replace the
two `.ttf` files here, re-run the ttf→woff2 conversion (`fonttools` with `brotli`,
`font.flavor = "woff2"`), copy the new `.woff2` files into `cloudflare-deploy/fonts/`,
and re-upload. Bump the version in `GLYPHS.md` and re-run the verification page.

## Why Pages, not R2

Pages was chosen over R2 because it can also serve `style-guide.html` itself later if
wanted, has a simpler custom-domain flow, and supports the `_headers` file for CORS +
caching without extra config.

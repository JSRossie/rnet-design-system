# GLYPHS.md — Curated Glyph Reference

**Companion to:** `SYSTEM.md` v1.6
**Document version:** 2.3
**Last updated:** 2026.05.24
**Authored against Nerd Fonts:** v3.4.0 (cmap-verified 2026.05.24)
**Font required:** JetBrainsMono Nerd Font ([install](https://www.nerdfonts.com/font-downloads))

---

## 0. How This Document Works

This is the **sanctioned glyph vocabulary** for the JR / R—Net design system. The full Nerd Font ships ~9,000 glyphs; using them indiscriminately produces noise. This curated set keeps every glyph meaningful.

The document is organized by **role** — what job the glyph does in our system — rather than by source library. Each role has one assigned glyph. Roles are stable; the specific glyphs assigned to them may evolve as Nerd Fonts versions change.

### Confidence tags

Each entry carries a tag indicating the reliability of its codepoint claim:

- **`[FA-stable]`** — Font Awesome glyph. Codepoints have been stable across Nerd Fonts v2.x and v3.x. High confidence; routine verification.
- **`[MDI-v3.x-claim]`** — Material Design Icon. Codepoint reflects the post-v3.0 MDI namespace (F0001+). Needs verification on first use; MDI codepoints have shifted between major versions and may continue to evolve.
- **`[verified-YYYY.MM]`** — entry confirmed to render correctly on the operator's machine on that date. Highest confidence. Replace the original tag once verified.
- **`[updated-YYYY.MM]`** — codepoint changed from a previous version of this document. Includes a brief note on why.
- **`[unfilled]`** — role exists but no glyph assigned yet. Pending lookup.

### Design biases

- **Font Awesome first.** When a role can be served by either FA or MDI, FA wins. FA codepoints are stable; MDI shifts. Brand and protocol logos are the exception — they exist only in non-FA sets, and that is expected (see §8–§9).
- **Curated set, not the full library.** The full Nerd Font ships ~9,000 glyphs; this registry sanctions a deliberate fraction of them, organized into categories. "Curated" means every role is vetted — not that the set is small. Variation across documents is consistency's enemy.
- **Roles outlive glyphs.** If a glyph becomes unavailable, the role persists and gets a new assignment.

### Inclusion criteria

A glyph role is admitted to this registry only when it clears **both** bars:

1. **Technical usability — a specific, recurring purpose.** The role must name a concrete thing the operator actually documents or instruments in the R—Net environment (a Proxmox host, a Z-Wave sensor, a firewall, a deploy target). If a role cannot point to real, recurring use, it does not belong here. Decorative or speculative "might be nice" glyphs are excluded by definition.
2. **Consistency.** The glyph must hold to the Discipline Rules (§11): one glyph per role, colour-follows-function, and visual coherence with its neighbours — glyphs sharing a category or a visual cluster are drawn from the same source set wherever the font allows.

The governing bias is **deliberate pre-curation over reactive ad-hoc selection.** It is better to define the full set of roles the operator will need up front — each vetted for purpose and consistency — than to let glyphs be chosen one at a time, under deadline, at the call site. A curated set the operator will actually use beats a larger set assembled inconsistently later. When a genuine new need appears, extend the registry through §12 — never improvise.

### For AI systems consuming this file

Restrict glyph use to entries in this file. When a needed glyph isn't here, follow §12 (How to extend) — do not invent ad hoc. If you encounter an `[unfilled]` or `[MDI-v3.x-claim]` entry, surface the uncertainty rather than silently using the codepoint.

---

## 1. Status & Indicators

The most common category. These appear in dashboards, logs, status lines, callout labels.

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `status-ok` | `U+F00C` |  | FA (check) | `[FA-stable]` | `ok-fg` (light), `ok-glow` (dark) |
| `status-fail` | `U+F00D` |  | FA (x / close) | `[FA-stable]` | `alert-fg`, `alert-glow` |
| `status-warn` | `U+F071` |  | FA (warning triangle) | `[FA-stable]` | `warn-fg`, `warn-glow` |
| `status-info` | `U+F129` |  | FA (info-i) | `[FA-stable]` | `sky-deep`, `sky-light` |
| `status-online` | `U+F111` |  | FA (circle) | `[updated-2026.05]` | `ok-fg`, `ok-glow` |
| `status-offline` | `U+F10C` |  | FA (circle-o) | `[updated-2026.05]` | `graphite`, `night-graphite` |
| `status-syncing` | `U+F021` |  | FA (refresh) | `[FA-stable]` | `warn-glow` (dark), `amber-deep` (light) |
| `status-time` | `U+F017` |  | FA (clock) | `[FA-stable]` | `graphite`, `night-graphite` |

---

## 2. Infrastructure & Network

For R—Net documents, system status, technical references.

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `infra-server` | `U+F233` |  | FA (server) | `[updated-2026.05]` | `amber` (dark), `sky-deep` (light) |
| `infra-database` | `U+F1C0` |  | FA (database) | `[FA-stable]` | `amber`, `sky-deep` |
| `infra-cloud` | `U+F0C2` |  | FA (cloud) | `[FA-stable]` | `amber`, `sky-deep` |
| `infra-network` | `U+F0E8` |  | FA (sitemap) | `[FA-stable]` | `amber`, `sky-deep` |
| `infra-router` | `U+F1087` | 󱂇 | MDI (router-network) | `[updated-2026.05]` | `amber`, `sky-deep` |
| `infra-wifi` | `U+F1EB` |  | FA (wifi) | `[FA-stable]` | `amber`, `sky-deep` |
| `infra-throughput` | `U+F0E7` |  | FA (bolt / lightning) | `[FA-stable]` | `amber`, `sky-deep` |
| `infra-device-mobile` | `U+F10B` |  | FA (mobile) | `[FA-stable]` | `graphite`, `night-graphite` |
| `infra-switch` | `U+F0317` | 󰌗 | MDI (lan) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-ups` | `U+F0079` | 󰁹 | MDI (battery) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-vm` | `U+EA7A` |  | Codicons (vm) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-container` | `U+F4B7` |  | Octicons (container) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-cluster` | `U+F06E1` | 󰛡 | MDI (hexagon-multiple) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-cpu` | `U+F0EE0` | 󰻠 | MDI (cpu-64-bit) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-memory` | `U+F035B` | 󰍛 | MDI (memory) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-storage` | `U+F02CA` | 󰋊 | MDI (harddisk) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-firewall` | `U+F1A11` | 󱨑 | MDI (wall-fire) | `[verified-2026.05]` | `alert-fg`, `alert-glow` |
| `infra-vpn` | `U+F0582` | 󰖂 | MDI (vpn) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-temperature` | `U+F050F` | 󰔏 | MDI (thermometer) | `[verified-2026.05]` | `warn-fg`, `warn-glow` |
| `infra-fan` | `U+F0210` | 󰈐 | MDI (fan) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-load` | `U+F029A` | 󰊚 | MDI (gauge) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-monitor` | `U+F0A07` | 󰨇 | MDI (monitor-dashboard) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-backup` | `U+F006F` | 󰁯 | MDI (backup-restore) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `infra-camera` | `U+F07AE` | 󰞮 | MDI (cctv) | `[verified-2026.05]` | `graphite`, `night-graphite` |

---

## 3. Location & Geography

For ceremonial and instrumented context — where something is happening.

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `loc-home-primary` | `U+F015` |  | FA (home) | `[FA-stable]` | `sky-deep` (light), `ground-light` (dark) |
| `loc-home-secondary` | `U+F1AD` |  | FA (building) | `[FA-stable]` | `sky-deep`, `ground-light` |
| `loc-pin` | `U+F041` |  | FA (map-marker) | `[FA-stable]` | `sky-deep`, `ground-light` |
| `loc-compass` | `U+F14E` |  | FA (compass) | `[FA-stable]` | `sky-deep`, `sky-light` |
| `loc-aviation` | `U+F072` |  | FA (plane) | `[FA-stable]` | `ground-deep` (light), `ground-light` (dark) |

> **Note on `loc-aviation`:** this is the JR signature glyph — the aviation easter-egg in personal footers and signatures. Use sparingly. FA's plane glyph is preferred over MDI's airplane variants because of FA codepoint stability.

---

## 4. Security & System Health

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `sec-lock` | `U+F023` |  | FA (lock) | `[FA-stable]` | `graphite`, `night-graphite` |
| `sec-shield` | `U+F132` |  | FA (shield) | `[FA-stable]` | `graphite`, `sky-deep` |
| `sec-key` | `U+F084` |  | FA (key) | `[FA-stable]` | `graphite`, `night-graphite` |

> **Note:** `sec-key` references credentials/access as a concept. Never display actual key/credential values alongside this glyph.

---

## 5. Document, Comms, Contact

For headers, metadata blocks, contact information.

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `doc-file` | `U+F15B` |  | FA (file) | `[FA-stable]` | `graphite`, `night-graphite` |
| `doc-folder` | `U+F07B` |  | FA (folder) | `[FA-stable]` | `graphite`, `night-graphite` |
| `comms-mail` | `U+F0E0` |  | FA (envelope) | `[FA-stable]` | `sky-deep` (light), `amber` (dark) |
| `comms-phone` | `U+F095` |  | FA (phone) | `[FA-stable]` | `sky-deep`, `amber` |
| `comms-calendar` | `U+F073` |  | FA (calendar) | `[FA-stable]` | `sky-deep`, `amber` |


### Content-Type Indicators

A distinct role class for **typed content in a layered document corpus** — the mark that tells a reader which *kind* of artifact they are looking at when a project ships several related document classes under one roof (a briefing and its supporting annexes, sources, primers, and timelines). Added v2.3.

These are **not** a repurposing of the document roles above. `doc-file` and `doc-folder` denote files and folders as objects; the `content-*` roles denote a document's *editorial class*. Reach for them only in projects that actually run a multi-class corpus — a single-document page does not need them (§0 inclusion bar). Names generalize past any one project's vocabulary: an "addendum" is a `content-deep-dive`; an "aviation primer" is a `content-guide`.

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `content-briefing` | `U+F0F6` |  | FA (file-lines) | `[FA-stable]` | `sky-deep` (light), `amber` (dark) |
| `content-deep-dive` | `U+F02D` |  | FA (book) | `[FA-stable]` | `sky-deep` (light), `amber` (dark) |
| `content-note` | `U+F249` |  | FA (sticky-note) | `[FA-stable]` | `sky-deep` (light), `amber` (dark) |
| `content-source` | `U+F187` |  | FA (archive) | `[FA-stable]` | `sky-deep` (light), `amber` (dark) |
| `content-guide` | `U+F518` |  | FA (book-open) | `[FA-stable]` | `sky-deep` (light), `amber` (dark) |
| `content-chronicle` | `U+F1EA` |  | FA (newspaper) | `[FA-stable]` | `sky-deep` (light), `amber` (dark) |
| `content-gallery` | `U+F302` |  | FA (images) | `[FA-stable]` | `sky-deep` (light), `amber` (dark) |


---

## 6. Development & Code

For technical context — repos, terminals, code references.

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `dev-git` | `U+F1D3` |  | FA (git) | `[FA-stable]` | `graphite`, `night-graphite` |
| `dev-branch` | `U+F126` |  | FA (code-fork) | `[FA-stable]` | `graphite`, `night-graphite` |
| `dev-terminal` | `U+F120` |  | FA (terminal) | `[FA-stable]` | `graphite`, `night-graphite` |
| `dev-code` | `U+F121` |  | FA (code brackets) | `[FA-stable]` | `graphite`, `night-graphite` |
| `dev-github` | `U+F09B` |  | FA (github) | `[FA-stable]` | `graphite`, `night-graphite` |
| `dev-linux` | `U+F17C` |  | FA (linux/tux) | `[FA-stable]` | `graphite`, `night-graphite` |

---

## 7. Drafting & Navigation (Signature Category)

These glyphs are the most aviation-coded and carry the strongest brand identity. Use deliberately.

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `nav-arrow-up-right` | `U+F08E` |  | FA (external-link) | `[FA-stable]` | `sky-deep`, `amber` |
| `nav-crosshair` | `U+F05B` |  | FA (crosshairs) | `[FA-stable]` | `sky-deep`, `amber` |
| `nav-target` | `U+F140` |  | FA (bullseye) | `[FA-stable]` | `sky-deep`, `amber` |
| `nav-direction` | `U+F124` |  | FA (location-arrow) | `[FA-stable]` | `sky-deep`, `amber` |
| `nav-grid` | `U+F00A` |  | FA (th / grid) | `[FA-stable]` | `graphite`, `night-graphite` |

---

## 8. Platform & Stack

Brand and technology logos for the tools that run the environment — hypervisors, container platforms, distros, hosting. Use only in technical metadata: repo headers, infrastructure tables, ops docs. Never in prose or ceremonial documents.

Brand logos cannot honour the Font-Awesome-first bias — they live in the Devicons and Font Logos sets. This is expected, not a downgrade. Where several distro logos appear together they are drawn from the same `linux-` (Font Logos) set so they stay visually consistent.

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `stack-docker` | `U+F21F` |  | FA (docker) | `[verified-2026.05]` | `sky-deep`, `sky-light` |
| `stack-kubernetes` | `U+F10FE` | 󱃾 | MDI (kubernetes) | `[verified-2026.05]` | `sky-deep`, `sky-light` |
| `stack-ubuntu` | `U+F31B` |  | Font Logos (ubuntu) | `[verified-2026.05]` | `amber`, `amber-deep` |
| `stack-debian` | `U+F306` |  | Font Logos (debian) | `[verified-2026.05]` | `alert-fg`, `alert-glow` |
| `stack-nixos` | `U+F313` |  | Font Logos (nixos) | `[verified-2026.05]` | `sky-deep`, `sky-light` |
| `stack-cloudflare` | `U+E792` |  | Devicons (cloudflare) | `[verified-2026.05]` | `amber`, `amber-deep` |

> **Proxmox, UniFi, and HP have no brand glyphs in Nerd Fonts.** Do not assign a generic glyph a brand's name. Proxmox hosts and HP MicroServers use `infra-server`; UniFi networking gear uses the functional roles `infra-router`, `infra-switch`, and `infra-wifi`.

---

## 9. Home Automation

For the smart-home layer of R—Net — Apple Home, Home Assistant, and the device/sensor vocabulary. Platform and protocol logos sit at the top of the table; device and sensor roles follow. Every glyph here is MDI, so the category is internally consistent.

| Role | Codepoint | Glyph | Source | Tag | Sanctioned colors |
|------|-----------|------:|--------|-----|-------------------|
| `home-assistant` | `U+F07D0` | 󰟐 | MDI (home-assistant) | `[verified-2026.05]` | `sky-deep`, `sky-light` |
| `home-apple` | `U+F0035` | 󰀵 | MDI (apple) | `[verified-2026.05]` | `graphite`, `night-graphite` |
| `home-zigbee` | `U+F0D41` | 󰵁 | MDI (zigbee) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `home-zwave` | `U+F0AEA` | 󰫪 | MDI (z-wave) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `home-bluetooth` | `U+F00AF` | 󰂯 | MDI (bluetooth) | `[verified-2026.05]` | `sky-deep`, `sky-light` |
| `home-matter` | `U+F0563` | 󰕣 | MDI (vector-triangle) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `home-light` | `U+F0335` | 󰌵 | MDI (lightbulb) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `home-thermostat` | `U+F0393` | 󰎓 | MDI (thermostat) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `home-lock` | `U+F08B2` | 󰢲 | MDI (lock-smart) | `[verified-2026.05]` | `graphite`, `night-graphite` |
| `home-door` | `U+F081A` | 󰠚 | MDI (door) | `[verified-2026.05]` | `graphite`, `night-graphite` |
| `home-window` | `U+F05AE` | 󰖮 | MDI (window-closed) | `[verified-2026.05]` | `graphite`, `night-graphite` |
| `home-motion` | `U+F0D91` | 󰶑 | MDI (motion-sensor) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `home-presence` | `U+F0826` | 󰠦 | MDI (home-account) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `home-blinds` | `U+F00AC` | 󰂬 | MDI (blinds) | `[verified-2026.05]` | `graphite`, `night-graphite` |
| `home-garage` | `U+F06D9` | 󰛙 | MDI (garage) | `[verified-2026.05]` | `graphite`, `night-graphite` |
| `home-doorbell` | `U+F12E6` | 󱋦 | MDI (doorbell) | `[verified-2026.05]` | `amber`, `sky-deep` |
| `home-smoke` | `U+F0392` | 󰎒 | MDI (smoke-detector) | `[verified-2026.05]` | `alert-fg`, `alert-glow` |
| `home-speaker` | `U+F04C3` | 󰓃 | MDI (speaker) | `[verified-2026.05]` | `graphite`, `night-graphite` |
| `home-tv` | `U+F0502` | 󰔂 | MDI (television) | `[verified-2026.05]` | `graphite`, `night-graphite` |
| `home-energy` | `U+F1903` | 󱤃 | MDI (home-lightning-bolt) | `[verified-2026.05]` | `warn-glow`, `amber-deep` |
| `home-automation` | `U+F07D1` | 󰟑 | MDI (home-automation) | `[verified-2026.05]` | `sky-deep`, `sky-light` |

> **Note on `home-matter`:** Matter has no logo glyph in Nerd Fonts; `md-vector_triangle` is an abstract stand-in, kept so the protocol is representable. Replace it when a real glyph ships. Thread and IPv6 likewise have no glyphs — Thread is covered in practice by `home-matter`; IPv6 is a networking concern outside this category.

---

## 10. Test Harness · Render Verification

To verify codepoints render as expected on your system, paste this block into a file viewed with JetBrainsMono Nerd Font. Each line shows the role, expected meaning, and the glyph. If the glyph doesn't match the meaning, the codepoint needs updating.

```
=== JR / R—Net Glyph Test Harness ===
Font: JetBrainsMono Nerd Font (any weight)

STATUS
  status-ok           [check mark]        
  status-fail         [x mark]            
  status-warn         [warning triangle]  
  status-info         [info-i]            
  status-online       [filled circle]     
  status-offline      [outline circle]    
  status-syncing      [refresh arrows]    
  status-time         [clock]             

INFRASTRUCTURE
  infra-server        [server]            
  infra-database      [database stack]    
  infra-cloud         [cloud]             
  infra-network       [sitemap]           
  infra-router        [router network]    󱂇
  infra-wifi          [wifi waves]        
  infra-throughput    [bolt]              
  infra-device-mobile [mobile phone]      
  infra-switch        [network switch]    󰌗
  infra-ups           [battery backup]    󰁹
  infra-vm            [virtual machine]   
  infra-container     [container]         
  infra-cluster       [node cluster]      󰛡
  infra-cpu           [processor]         󰻠
  infra-memory        [memory / RAM]      󰍛
  infra-storage       [disk]              󰋊
  infra-firewall      [firewall]          󱨑
  infra-vpn           [vpn tunnel]        󰖂
  infra-temperature   [thermometer]       󰔏
  infra-fan           [cooling fan]       󰈐
  infra-load          [load gauge]        󰊚
  infra-monitor       [dashboard]         󰨇
  infra-backup        [backup / restore]  󰁯
  infra-camera        [cctv camera]       󰞮

LOCATION
  loc-home-primary    [house]             
  loc-home-secondary  [building]          
  loc-pin             [map marker pin]    
  loc-compass         [compass]           
  loc-aviation        [airplane]          

SECURITY
  sec-lock            [lock]              
  sec-shield          [shield]            
  sec-key             [key]               

DOCUMENT / COMMS
  doc-file            [paper file]        
  doc-folder          [folder]            
  comms-mail          [envelope]          
  comms-phone         [telephone]         
  comms-calendar      [calendar]          

CONTENT TYPES
  content-briefing    [document, lines]   
  content-deep-dive   [book]              
  content-note        [sticky note]       
  content-source      [archive box]       
  content-guide       [open book]         
  content-chronicle   [newspaper]         
  content-gallery     [image gallery]    

DEV
  dev-git             [git logo]          
  dev-branch          [code fork]         
  dev-terminal        [terminal prompt]   
  dev-code            [code brackets]     
  dev-github          [github logo]       
  dev-linux           [tux/linux]         

NAVIGATION
  nav-arrow-up-right  [external link↗]    
  nav-crosshair       [crosshairs+]       
  nav-target          [bullseye]          
  nav-direction       [arrow ↗]           
  nav-grid            [grid 3x3]          


PLATFORM & STACK
  stack-docker        [docker logo]       
  stack-kubernetes    [kubernetes logo]   󱃾
  stack-ubuntu        [ubuntu logo]       
  stack-debian        [debian logo]       
  stack-nixos         [nixos snowflake]   
  stack-cloudflare    [cloudflare logo]   

HOME AUTOMATION
  home-assistant      [HA logo]           󰟐
  home-apple          [apple logo]        󰀵
  home-zigbee         [zigbee logo]       󰵁
  home-zwave          [z-wave logo]       󰫪
  home-bluetooth      [bluetooth]         󰂯
  home-matter         [matter stand-in]   󰕣
  home-light          [lightbulb]         󰌵
  home-thermostat     [thermostat]        󰎓
  home-lock           [smart lock]        󰢲
  home-door           [door]              󰠚
  home-window         [window]            󰖮
  home-motion         [motion sensor]     󰶑
  home-presence       [someone home]      󰠦
  home-blinds         [blinds]            󰂬
  home-garage         [garage door]       󰛙
  home-doorbell       [doorbell]          󱋦
  home-smoke          [smoke detector]    󰎒
  home-speaker        [smart speaker]     󰓃
  home-tv             [television]        󰔂
  home-energy         [home energy]       󱤃
  home-automation     [automation/scene]  󰟑

=== End Test Harness ===
```

**Procedure to use:**

1. Copy this block into a text editor or terminal that uses JetBrainsMono Nerd Font.
2. Verify each glyph matches its description.
3. For any mismatch, search the role name (e.g., "router") at [nerdfonts.com/cheat-sheet](https://www.nerdfonts.com/cheat-sheet).
4. Replace the codepoint in the corresponding section above.
5. Update the tag to `[verified-YYYY.MM]` for confirmed entries, or `[updated-YYYY.MM — was U+XXXX, now U+YYYY, reason: ...]` for changes.
6. Log the audit in §13 below.

---

## 11. Discipline Rules

These apply regardless of which specific glyphs are sanctioned:

- **Ceremonial documents** use glyphs sparingly — typically only in metadata blocks (location, contact, date). Never in body prose.
- **Instrumented documents** use glyphs to carry meaning, never decoration. If a glyph can be removed without losing information, remove it.
- **Color follows function.** Status glyphs use semantic R/Y/G. Brand-context glyphs use the appropriate accent. Section glyphs use the dominant accent for that mode (sky in light, amber in dark).
- **One glyph per role.** If a role has multiple visual candidates, pick one and stick with it. Two glyphs for the same job is the start of inconsistency.
- **Roles are stable; glyphs are mutable.** When Nerd Fonts shifts codepoints, update the glyph assignment, not the role.

---

## 12. How to Extend

The system is designed to grow. When you need a role this document doesn't cover:

1. **Verify the need.** Is the new role genuinely required, or does an existing role cover it? Default to existing.
2. **Name the role.** Follow `category-purpose` (e.g., `infra-loadbalancer`, `loc-property-rental`). Lowercase, hyphen-separated.
3. **Find the glyph.** Search [nerdfonts.com/cheat-sheet](https://www.nerdfonts.com/cheat-sheet) for the visual intent. Prefer FA (stable) over MDI (shifts).
4. **Assign sanctioned colors.** Which palette tokens may render this glyph? Default to neighboring roles in the category.
5. **Tag appropriately.** New FA entries can ship `[FA-stable]` immediately. New MDI entries ship `[MDI-v3.x-claim]` until verified.
6. **Verify.** Run through the §10 test harness on your system before considering the entry settled.
7. **Log it.** Add an entry to §13 audit log.

### When NOT to add a role

- For one-time decorative use. Find a way to communicate without the glyph.
- For a role already covered. Reuse instead.
- For glyphs that conflict with semantic color rules.
- For emoji replacement / flair.

### Removing roles

If a role hasn't been used in any output after six months, consider removing it. Smaller is better. Log removals in §13.

---

## 13. Audit Log

Track verifications, updates, and additions over time. New entries on top.

| Date | Action | Role(s) | Notes |
|------|--------|---------|-------|
| 2026.05.24 | Added | §5 content-type (7): content-briefing, content-deep-dive, content-note, content-source, content-guide, content-chronicle, content-gallery | New "Content-Type Indicators" role class under §5 for typed content in a layered document corpus (per the sabrina-flight-path §12 RFC). All seven are Font Awesome, codepoints cmap-verified present in JetBrainsMono Nerd Font v3.4.0 on 2026.05.24; tagged `[FA-stable]`. Operator visual confirmation pending via §10 harness. All seven map to real surfaces in the requesting consumer (briefings, addenda, notes, sources, primer, dated pages, photo gallery), so none were deferred. Resolves a downstream workaround that repurposed `nav-target`/`doc-file`/`dev-terminal`/`sec-lock`/`loc-compass`/`comms-calendar` for content classes and loaded Font Awesome via cdnjs. Paired with the new name-based CSS class layer (`glyphs.css`) so consumers reference role names, not raw PUA codepoints. |
| 2026.05.15 | Added | §2 infra (16) · §8 stack (6) · §9 home (21) | 43 roles added — home-lab + home-automation expansion. All codepoints cmap-verified against JetBrainsMono Nerd Font v3.4.0 and operator-confirmed via the candidate preview pages; tagged `[verified-2026.05]`. New categories §8 Platform & Stack and §9 Home Automation; meta sections renumbered §10–§15. Charter §0 gained explicit inclusion criteria. `stack-proxmox` rejected (no brand glyph — Proxmox uses `infra-server`); `infra-uptime` rejected (redundant with `status-online`). |
| 2026.05.15 | Verified | All §1–§7 (40 roles) | cmap audit against JetBrainsMono Nerd Font v3.4.0 — all 40 codepoints present in font. 36 entries confirmed glyph-name-correct; 4 mismatches corrected (rows below). |
| 2026.05.15 | Updated | infra-server | Was U+F0A0 (rendered `fa-hdd_o`, a hard-drive). Now U+F233 (`fa-server`). |
| 2026.05.15 | Updated | infra-router | Was U+F0A1F (rendered `md-vote`, a ballot box — bad MDI-v3.x claim). Now U+F1087 (`md-router_network`). |
| 2026.05.15 | Updated | status-online | Was U+F0AA5 (`md-circle_slice_8`, an 8/8 pie). Now U+F111 (`fa-circle`). Moved MDI→FA per FA-first bias. |
| 2026.05.15 | Updated | status-offline | Was U+F0AA4 (`md-circle_slice_7`, a 7/8 pie — not an outline circle). Now U+F10C (`fa-circle-o`). Moved MDI→FA. |
| 2026.05.14 | Initial creation | All §1–§7 | v2.0 of GLYPHS.md. All MDI entries `[MDI-v3.x-claim]`; all FA entries `[FA-stable]`. Pending verification pass against JetBrainsMono Nerd Font installed locally. |

### Audit entry template

When you verify, update, or add entries, append a row like:

```
| 2026.MM.DD | Verified | status-online, status-offline | Confirmed render correctly in JetBrainsMono Nerd Font v3.x on macOS. Tags updated to [verified-2026.MM]. |
| 2026.MM.DD | Updated  | infra-router                  | Was U+F0A1F (rendered as wrong glyph). Now U+XXXXX (router-network in current MDI namespace). Tag: [updated-2026.MM]. |
| 2026.MM.DD | Added    | infra-loadbalancer            | New role for upcoming dashboard work. Assigned U+XXXX [FA-stable]. |
| 2026.MM.DD | Removed  | dev-pomicons                  | Unused for 6+ months. Removed to keep set lean. |
```

---

## 14. Reference Links

- **Nerd Font cheat sheet (search & verify):** https://www.nerdfonts.com/cheat-sheet
- **Glyphnames.json (authoritative codepoint registry):** https://github.com/ryanoasis/nerd-fonts/blob/master/glyphnames.json
- **Nerd Fonts releases & changelogs:** https://github.com/ryanoasis/nerd-fonts/releases
- **JetBrainsMono Nerd Font download:** https://www.nerdfonts.com/font-downloads
- **Install via Homebrew:** `brew install --cask font-jetbrains-mono-nerd-font`

---

## 15. Version History

| Version | Date | Notes |
|---------|------|-------|
| 1.0 | 2026.05.14 | Initial draft. Codepoints later found to be partially unreliable (some MDI entries from stale training data). |
| 2.1 | 2026.05.15 | cmap-verified against JetBrainsMono Nerd Font v3.4.0. Four codepoint corrections (`infra-server`, `infra-router`, `status-online`, `status-offline`); the two status-circle roles moved MDI→FA. Font self-hosted at `cdn.rossie.net`; @font-face in style-guide.html updated. No `[MDI-v3.x-claim]` entries remain. |
| **2.3** | 2026.05.24 | **Current.** New "Content-Type Indicators" role class under §5: +7 `content-*` roles (briefing, deep-dive, note, source, guide, chronicle, gallery) for typed content in a layered document corpus — all Font Awesome, cmap-verified against JetBrainsMono Nerd Font v3.4.0, `[FA-stable]`. Adds a name-based CSS class layer (`glyphs.css`, generated from this file) so consumers reference role names rather than raw PUA codepoints; resolves a downstream consumer's role-repurposing + Font-Awesome-via-cdnjs workaround. Subset font + `UNICODE-RANGE.css` rebuilt for the new codepoints. |
| 2.2 | 2026.05.15 | Home-lab + home-automation expansion: +16 infrastructure roles, new §8 Platform & Stack (6 roles) and §9 Home Automation (21 roles) — 43 added, all cmap-verified `[verified-2026.05]`. Charter §0 adds explicit inclusion criteria (technical usability + consistency; pre-curation over ad-hoc). Distro logos unified to the `linux-` set. Meta sections renumbered §10–§15. |
| 2.0 | 2026.05.14 | Restructured as role-based with confidence tags. FA bias established. Audit procedure formalized. ~30 roles defined across 7 categories. All MDI entries pending verification pass. |

---

*End of GLYPHS.md · v2.2 · 2026.05.15*

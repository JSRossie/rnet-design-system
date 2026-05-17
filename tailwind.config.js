/**
 * Tailwind CSS preset for the JR / R—Net design system.
 *
 * Version:      1.1
 * Source:       SYSTEM.md v1.3 · tokens.json v1.1
 * Last updated: 2026.05.17
 *
 * Usage in tailwind.config.js:
 *
 *   import jrPreset from './path/to/tailwind.config.js'
 *   export default {
 *     presets: [jrPreset],
 *     content: ['./src/**\/*.{html,js,jsx,ts,tsx}'],
 *   }
 *
 * Then use tokens in markup:
 *
 *   <div class="bg-paper-true text-ink p-12">
 *     <h1 class="font-display text-display tracking-display">James Rossie</h1>
 *     <span class="font-mono text-h2 text-sky-deep tracking-label uppercase">
 *       Correspondence
 *     </span>
 *   </div>
 *
 * --- v1.1 additions (web-control primitives) ---
 *
 *   <div class="rounded-card border-rule-strong shadow-popover
 *               p-5 ease-instrument duration-base">
 *     <h2 class="text-subhead tracking-subhead leading-subhead">…</h2>
 *     <p  class="text-body-sm">…</p>
 *     <code class="text-code font-mono">…</code>
 *   </div>
 *
 * v1.1 exposes the new radii, motion, extended spacing, and the
 * web-control type sizes (subhead, h3, body-sm, code) so consumers
 * using Tailwind have the same vocabulary as consumers using
 * `colors_and_type.css` directly.
 */

module.exports = {
  theme: {
    extend: {
      colors: {
        // Surfaces · Light
        'paper-true':   '#FAF6EC',
        'paper-chart':  '#FCF4DF',
        'urban':        '#F8E4AE',

        // Surfaces · Night
        'night':        '#1C1E1C',
        'night-2':      '#252824',
        'night-3':      '#2F322D',
        'night-4':      '#3A3D37',
        'cream':        '#EDE8D8',

        // Structure
        'ink':          '#1F1D18',
        'ink-2':        '#3A3730',
        'graphite':     '#6B675C',
        'soft':         '#989486',
        'panel-light':  '#D4CEBC',
        'panel':        '#8E8B80',
        'panel-deep':   '#5A5750',
        'night-rule':   '#3D403A',
        'night-rule-soft': '#2A2D28',
        'night-graphite':  '#8A8470',
        'night-soft':   '#5E5B50',

        // Brand · Cockpit-sourced
        'sky':          '#6B9BB8',
        'sky-deep':     '#4A7A96',
        'sky-light':    '#A8C5D8',
        'ground':       '#8B5A3C',
        'ground-deep':  '#6B4226',
        'ground-light': '#B08362',
        'amber':        '#D49826',  // dark mode only
        'amber-glow':   '#F0B84A',
        'amber-deep':   '#8C6018',

        // Semantic · Universal R/Y/G
        'ok-fg':        '#4A7A3A',
        'ok-bg':        '#D8E0C8',
        'ok-glow':      '#8DB072',
        'warn-fg':      '#7A5A10',
        'warn-bg':      '#F5E4A8',
        'warn-glow':    '#E6B84A',
        'alert-fg':     '#A8362A',
        'alert-bg':     '#ECC8C0',
        'alert-glow':   '#D4604E',
      },

      fontFamily: {
        'display': ['Outfit', 'sans-serif'],
        'body':    ['Urbanist', 'sans-serif'],
        'mono':    ['JetBrainsMono Nerd Font', 'JetBrains Mono', 'monospace'],
        // Tailwind defaults for sans/serif/mono
        'sans':    ['Urbanist', 'sans-serif'],
      },

      fontSize: {
        // System-named sizes
        'display':  ['48px', { lineHeight: '1.05', letterSpacing: '-1.5px', fontWeight: '600' }],
        'h1':       ['32px', { lineHeight: '1.15', letterSpacing: '-0.5px', fontWeight: '500' }],
        'h2':       ['12px', { lineHeight: '1',    letterSpacing: '2.5px',  fontWeight: '500' }],
        'body':     ['15px', { lineHeight: '1.7' }],
        'metadata': ['10px', { lineHeight: '1.6',  letterSpacing: '1.5px' }],

        // v1.1 — web-control type sizes
        // Note: `subhead` is what colors_and_type.css exposes as `--type-h2`,
        // a web-conventional sub-section heading. SYSTEM.md §3's "H2" remains
        // the 12px mono label above. See PR notes / SYSTEM.md §16.
        'subhead':  ['20px', { lineHeight: '1.25', letterSpacing: '-0.2px', fontWeight: '500' }],
        'h3':       ['16px', { lineHeight: '1.35' }],
        'body-sm':  ['13px', { lineHeight: '1.55' }],
        'code':     ['13px', { lineHeight: '1.6' }],
      },

      letterSpacing: {
        'display-tight': '-1.5px',
        'h1-tight':      '-0.5px',
        'label':         '2.5px',
        'meta':          '1.5px',

        // v1.1
        'subhead':       '-0.2px',
      },

      lineHeight: {
        'display': '1.05',
        'h1':      '1.15',
        'body':    '1.7',

        // v1.1
        'subhead': '1.25',
      },

      spacing: {
        // System-named spacing scale
        'page':    '48px',
        'section': '72px',
        'element': '20px',

        // v1.1 — numeric scale. `5`, `8`, `9` are aliases of the named
        // values above (kept here for consistency in numeric usage).
        '1':  '4px',
        '2':  '8px',
        '3':  '12px',
        '4':  '16px',
        '5':  '20px',
        '6':  '28px',
        '7':  '40px',
        '8':  '48px',
        '9':  '72px',
        '10': '96px',
      },

      maxWidth: {
        'technical': '1280px',
        'prose-jr':  '720px',  // 'prose' is taken by Tailwind Typography
      },

      borderWidth: {
        'stripe':      '4px',
        // v1.1
        'hair':        '1px',
        'rule-strong': '2px',
      },

      borderRadius: {
        // v1.1 — architectural radii. No pill on buttons by spec (§16).
        'none':  '0',
        'field': '2px',     // buttons, inputs, segmented items
        'chip':  '4px',     // tags, badges
        'card':  '6px',     // cards, modals, drawers, toasts
        'pill':  '9999px',  // switch tracks, progress bars, .badge--pill
      },

      transitionTimingFunction: {
        // v1.1 — system-default ease. Quick start, gentle settle.
        'instrument': 'cubic-bezier(0.2, 0, 0.1, 1)',
      },

      transitionDuration: {
        // v1.1
        'fast': '120ms',
        'base': '180ms',
        'slow': '260ms',
      },

      boxShadow: {
        // v1.1 — only used on floating surfaces (popover, dropdown, modal,
        // toast). Per §12, shadow is reserved for floating surfaces; flat
        // panels use borders. Day-mode values; switch via `data-mode` CSS.
        'popover': '0 1px 0 #D4CEBC, 0 4px 18px -8px rgba(31, 29, 24, 0.18)',
        'modal':   '0 1px 0 #D4CEBC, 0 24px 80px -24px rgba(31, 29, 24, 0.28)',
      },
    },
  },

  plugins: [],
}

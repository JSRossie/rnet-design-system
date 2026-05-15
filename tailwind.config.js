/**
 * Tailwind CSS preset for the JR / R—Net design system.
 *
 * Version:      1.0
 * Source:       SYSTEM.md v1.2 · tokens.json v1.0
 * Last updated: 2026.05.14
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
      },

      letterSpacing: {
        'display-tight': '-1.5px',
        'h1-tight':      '-0.5px',
        'label':         '2.5px',
        'meta':          '1.5px',
      },

      lineHeight: {
        'display': '1.05',
        'h1':      '1.15',
        'body':    '1.7',
      },

      spacing: {
        // System-named spacing scale
        'page':    '48px',
        'section': '72px',
        'element': '20px',
      },

      maxWidth: {
        'technical': '1280px',
        'prose-jr':  '720px',  // 'prose' is taken by Tailwind Typography
      },

      borderWidth: {
        'stripe': '4px',
      },
    },
  },

  plugins: [],
}

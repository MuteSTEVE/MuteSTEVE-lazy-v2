return {
  'L3MON4D3/LuaSnip',
  event = "InsertEnter",
  dependencies = { 'rafamadriz/friendly-snippets', event = "InsertEnter" },
  {
    'ults-io/vscode-react-javascript-snippets',
    build = 'yarn install --frozen-lockfile && yarn compile',
  },
}

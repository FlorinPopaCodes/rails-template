import { defineConfig } from "vite"
import react from "@vitejs/plugin-react"
import ViteRuby from "vite-plugin-ruby"
import { resolve } from "path"

export default defineConfig({
  plugins: [react(), ViteRuby()],
  resolve: {
    alias: { "@": resolve(__dirname, "app/frontend") },
  },
})

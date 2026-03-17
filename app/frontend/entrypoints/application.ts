import { createInertiaApp } from "@inertiajs/react"
import { createElement } from "react"
import { createRoot } from "react-dom/client"

createInertiaApp({
  resolve: (name) => {
    const pages = import.meta.glob("../pages/**/*.tsx", { eager: true })
    const page = pages[`../pages/${name}.tsx`]
    if (!page) throw new Error(`Page not found: ${name}`)
    return page
  },
  setup({ el, App, props }) {
    createRoot(el).render(createElement(App, props))
  },
})

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [

    "./assets/**/*.js",
    "./templates/**/*.html.twig",
    "./src/**/*.{html,js}",
    "./node_modules/tw-elements/js/**/*.js"
  ],
  theme: {
    extend: {},
  },
  plugins: [require("tw-elements/plugin.cjs")],
  darkMode: "class"

}


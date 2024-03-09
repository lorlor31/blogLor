/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [

    "./assets/**/*.js",
    "./templates/**/*.html.twig",
    "./src/**/*.{html,js}",
    "./node_modules/tw-elements/js/**/*.js",
    "./node_modules/tw-elements/dist/js/**/*.js"
  ],
  theme: {
    extend:{ 
      fontFamily: {
        madimi: ['"Madimi One"', "sans-serif"],
        // Add more custom font families as needed
      },
    },
    plugins: [
      require("tw-elements/plugin.cjs"),
      // require('tw-elements/dist/plugin')

    ],
  darkMode: "class"
}
}

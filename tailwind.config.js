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
      backgroundImage : {
        // 'profileBg' : "url('images/profile-bg.jpg')", 
        // pas utilisée de cette manière pour l'instant
      }
    },
    plugins: [
      require("tw-elements/plugin.cjs"),
      require('@tailwindcss/forms'),
      // require('tw-elements/dist/plugin')

    ],
  darkMode: "class"
}
}

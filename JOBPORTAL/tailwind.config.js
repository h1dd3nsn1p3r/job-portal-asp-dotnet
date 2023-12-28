module.exports = {
    content: ["**/*.razor", "**/*.cshtml", "**/*.html", "node_modules/preline/dist/*.js"],
    plugins: [
        require('tailwindcss'),
        require('autoprefixer'),
        require('@tailwindcss/forms'),
        require('preline/plugin'),
    ],
    theme: {
        extend: {
            fontFamily: {
                sans: ['Inter', 'sans-serif'],
                serif: ['Merriweather', 'serif'],
            }, 
        },
    },
}
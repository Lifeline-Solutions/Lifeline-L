module.exports = {
  theme: {
    extend: {
      backgroundImage: (theme) => ({
        "bg-image": "url('/assets/images/Registration.png')",
      }),
    },
    content: [
      "./app/views/**/*",
      "./app/helpers/**/*.rb",
      "./app/assets/stylesheets/**/*.css",
      "./app/javascript/**/*.js",
    ],
  },
};

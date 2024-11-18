const { environment } = require('@rails/webpacker')

// Update the `node` section to align with the new Webpack configuration schema.
environment.config.merge({
  node: {
    global: true,
    __dirname: false,
    __filename: false,
  },
});

module.exports = environment;

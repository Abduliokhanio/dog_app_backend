const { environment } = require('@rails/webpacker');

// Update the `node` configuration to align with Webpack 5
environment.config.merge({
  node: false, // Completely disable Node.js polyfills as recommended by Webpack 5
});

module.exports = environment;

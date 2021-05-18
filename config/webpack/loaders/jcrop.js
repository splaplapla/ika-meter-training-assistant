module.exports = {
  test: require.resolve('jcrop'),
  use: [{
    loader: 'expose-loader',
    options: {
      exposes: [
        { globalName: 'Jcrop',override: true },
      ],
    },
  }]
}

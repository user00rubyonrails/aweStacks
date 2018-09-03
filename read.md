default docker rails
  docker-compose run web rails new . -f -d postgresql 


Rails & Webpacker
  rails new rails-react-starter-tutorial --webpack=react --database=postgresql -T 

  yarn add webpack webpack-merge js-yaml path-complete-extname webpack-manifest-plugin babel-loader@7.x coffee-loader coffee-script babel-core babel-preset-env babel-polyfill compression-webpack-plugin rails-erb-loader glob extract-text-webpack-plugin node-sass file-loader sass-loader css-loader style-loader postcss-loader autoprefixer postcss-smart-import precss resolve-url-loader babel-plugin-syntax-dynamic-import babel-plugin-transform-class-properties 

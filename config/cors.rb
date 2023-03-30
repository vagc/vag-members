Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://6425770e4e0e5300b7b1fa34--stunning-semolina-c06e78.netlify.app/',
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
class SabayonMiddleware::Railtie < Rails::Railtie
  initializer "sabayon_middleware.initialisation" do
    config.app_middleware.insert_before 0, "SabayonMiddleware::Middleware"
  end
end

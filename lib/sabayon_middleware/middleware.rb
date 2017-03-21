class SabayonMiddleware::Middleware
  HEADERS = {"Content-Type" => "text/plain"}.freeze

  def initialize(app, variables = ENV)
    @app   = app
    @pairs = SabayonMiddleware::Pairs.call(variables)
  end

  def call(env)
    pairs.each do |token, key|
      if env["PATH_INFO"] == "/.well-known/acme-challenge/#{token}"
        return [200, HEADERS, [key]]
      end
    end

    app.call(env)
  end

  private

  attr_reader :app, :pairs
end

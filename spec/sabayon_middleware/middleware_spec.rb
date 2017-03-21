require "spec_helper"

RSpec.describe SabayonMiddleware::Middleware do
  include Rack::Test::Methods

  context "with a single key/token pair" do
    def app
      @app ||= Rack::Builder.new do
        use SabayonMiddleware::Middleware,
          "ACME_KEY"   => "foo",
          "ACME_TOKEN" => "bar"
        run RackApp
      end
    end

    it "returns the key for the requested token" do
      get "/.well-known/acme-challenge/bar"

      expect(last_response.body).to eq("foo")
    end

    it "falls back to the standard app for other requests" do
      get "/"

      expect(last_response.body).to eq("OK")
    end
  end

  context "with multiple key/token pairs" do
    def app
      @app ||= Rack::Builder.new do
        use SabayonMiddleware::Middleware,
          "ACME_KEY_0"   => "foo",
          "ACME_TOKEN_0" => "bar",
          "ACME_KEY_1"   => "baz",
          "ACME_TOKEN_1" => "qux"
        run RackApp
      end
    end

    it "returns the key for the requested tokens" do
      get "/.well-known/acme-challenge/bar"

      expect(last_response.body).to eq("foo")

      get "/.well-known/acme-challenge/qux"

      expect(last_response.body).to eq("baz")
    end

    it "falls back to the standard app for other requests" do
      get "/"

      expect(last_response.body).to eq("OK")
    end
  end
end

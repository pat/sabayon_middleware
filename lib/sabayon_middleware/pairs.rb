class SabayonMiddleware::Pairs
  def self.call(variables = ENV)
    new(variables).call
  end

  def initialize(variables)
    @variables = variables
  end

  def call
    if single_pair?
      return {variables["ACME_TOKEN"] => variables["ACME_KEY"]}
    end

    token_variables.inject({}) do |hash, (key, value)|
      index       = key.match(/^ACME_TOKEN_([0-9]+)/)[1]
      hash[value] = variables["ACME_KEY_#{index}"]

      hash
    end
  end

  private

  attr_reader :variables

  def single_pair?
    variables["ACME_KEY"] && variables["ACME_TOKEN"]
  end

  def token_variables
    variables.inject({}) do |hash, (key, value)|
      hash[key] = value if key[/^ACME_TOKEN_([0-9]+)/]
      hash
    end
  end
end

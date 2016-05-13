# Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL'], log: true


# Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['https://5w3w0atn:aj6weajxd4qsq0kx@privet-3653054.us-east-1.bonsai.io'], log: true



Elasticsearch::Model.client = Elasticsearch::Client.new url: BONSAI_URL, log: true
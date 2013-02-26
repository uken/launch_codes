configure do
  Fluent::Logger::FluentLogger.open(nil, :host => '127.0.0.1', :port => 24224)
  set :key, "events.#{settings.environment}.#{ENV['key']}"
end

get '/' do
  'HADOUKEN!'
end

post '/log' do
  data = JSON.parse(request.body.read)

  Fluent::Logger.default.post(settings.key, data)
  201
end

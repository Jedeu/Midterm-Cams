configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    database: 'dd4g8pa0t2r0e0',
    username: 'Suhduude',
    password: 'Iunno',
    host: 'ec2-54-204-3-200.compute-1.amazonaws.com',
    port: '5432',
    pool: 5,
    encoding: 'utf8',
    min_messages: 'error'
    )
  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end

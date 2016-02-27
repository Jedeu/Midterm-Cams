configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  set :database, {
    # adapter: "postgresql",
    # database: "dd4g8pa0t2r0e0",
    # username: 'rvaouvsgssbyzl',
    # password: 'FUrb1aGjjMNi0fK94H_1MnVsb4',
    # host: 'ec2-54-204-3-200.compute-1.amazonaws.com',
    # port: 5432,
    # encoding: 'unicode'
    adapter: "sqlite3",
    database: "db/db.sqlite3"
  }

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end

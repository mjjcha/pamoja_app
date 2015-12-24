configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  if development?
    set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
    }
  else
    set :database, ENV['DATABASE_URL']
  end
  
  set :database, {
    host: "ec2-54-83-59-154.compute-1.amazonaws.com",
    adapter: "postgresql",
    database: "det9u03d5d2d1k",
    user: "xlxutricqomtyx",
    password: "C4B1mbiLKRdBaB_Gkxdiktk_pK",
    port: "5432"
  }

 # Load all models from app/models, using autoload instead of require
 # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end
end

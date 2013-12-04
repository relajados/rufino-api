
require "logger"
require "pathname"
require "em-synchrony"
require "em-synchrony/em-http"

class RufinoApiImpl

  attr_reader :root, :env, :logger

  def initialize
    @root = Pathname.new(File.absolute_path("../../..", __FILE__))
    @env = ENV["RACK_ENV"] || "development"
    @logger = Logger.new(log_file).tap {|logger| logger.level = Logger::INFO }
  end

  def log_file
    @log_file ||= if @env == "production"
      STDOUT
    else
      root.join("log", env + ".log").open("a")
    end
  end

  def application
    @application ||= Rack::Builder.new do

      map "/v1/relajo" do
        run RelajoApi
      end

      map "/v1/work" do
        run WorkApi
      end
    end
  end

  def models
      root.
        join("app", "models").
        children.
        select {|path| path.extname == ".rb" }.
        map {|path| path.basename.to_s.gsub(/\.\w+$/, "").camelize }.
        map {|model_name| model_name.constantize }
  end

end

RufinoApi = RufinoApiImpl.new

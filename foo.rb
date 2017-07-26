require 'rubygems'
require 'sinatra'

#set :port, ENV['VCAP_APP_PORT']
set :port, ENV['CF_INSTANCE_PORT']

get '/' do
  host = ENV['VCAP_APP_HOST']
  port = ENV['VCAP_APP_PORT']
  hostsk = ENV['CF_INSTANCE_IP'] || "192.168.0.0"
  portsk = ENV['CF_INSTANCE_PORT'] || "9292"
  indexsk = ENV['CF_INSTANCE_INDEX'] || "0"

  msg = "<h1>Hello from VCAP! via: #{host}:#{port}</h1>"
  puts msg
  msg
end

get '/crash/:id' do
  Process.kill(9, params[:id].to_i)
end

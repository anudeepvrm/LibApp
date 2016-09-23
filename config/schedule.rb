set :output, 'G:/OODD/Ruby/Project/LibApp/log/whenever.log'
every 1.minutes do
  command "rm G:/OODD/Ruby/Project/LibApp/log/text.txt", environment => "development"
end

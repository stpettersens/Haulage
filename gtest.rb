require "growl"

Growl.notify do |n|
  n.message = 'Hello World'
  n.icon = :jpeg
  n.stick!
end


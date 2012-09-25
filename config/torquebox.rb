# this file will override the configs in torquebox.yml
TorqueBox.configure do
  # no need to set threadsafe! on production conf
  pool :web, :type => :shared
end

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Whetstone::Application.initialize!

# Require textacular with ActiveRecord
require 'textacular'
ActiveRecord::Base.extend(Textacular)

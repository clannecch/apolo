# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application

$MULTIPLE_COMPANIES=false
$CURRENT_COMPANY=nil

APSSueldos::Application.initialize!


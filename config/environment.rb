# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application

$MULTIPLE_COMPANIES=false
$CURRENT_COMPANY=nil

Date::DATE_FORMATS[:default] = "%d/%m/%Y"

APSSueldos::Application.initialize!


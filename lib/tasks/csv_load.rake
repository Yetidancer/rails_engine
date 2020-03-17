require 'csv'

namespace :csv_load do
  desc "Load CSV"
  task load: :environment do
    csv_text = File.read('customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      
  end

  desc "Unload CSV"
  task unload: :environment do
  end

end

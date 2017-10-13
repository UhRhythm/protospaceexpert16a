# encoding: utf-8
require "csv"

companies_csv = CSV.readlines("db/prototypes.csv")
companies_csv.shift
companies_csv.each do |row|
  Company.create(title: row[1], catch_copy: row[2], concept: row[3], user_id: row[4])
end


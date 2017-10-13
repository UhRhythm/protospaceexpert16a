# encoding: utf-8
require "csv"
companies_csv = CSV.readlines("db/comments.csv")
companies_csv.shift
companies_csv.each do |row|
  Comment.create(text: row[1], user_id: row[2], prototype_id: row[3])
end

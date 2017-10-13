
100.times do |no|
  Prototype.create(title: "title#{no}", catch_copy: "catch_copy#{no}", concept: "concept#{no}", user_id: "#{no}")
end

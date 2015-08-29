json.array!(@students) do |student|
  json.extract! student, :id, :lname, :fname, :clsname, :grade, :genderf
  json.url student_url(student, format: :json)
end

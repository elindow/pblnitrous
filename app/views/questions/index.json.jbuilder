json.array!(@questions) do |question|
  json.extract! question, :id, :num, :page, :qtext, :answer, :notes
  json.url question_url(question, format: :json)
end

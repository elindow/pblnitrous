json.array!(@perf_types) do |perf_type|
  json.extract! perf_type, :id, :ps, :pt, :as, :cq, :po, :io, :db, :question_id, :student_id
  json.url perf_type_url(perf_type, format: :json)
end

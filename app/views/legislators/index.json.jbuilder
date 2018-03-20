json.draw @draw
json.totalRecords @total
json.data do
  json.array!(@legislators, partial: 'legislators/legislator', as: :legislator)
end
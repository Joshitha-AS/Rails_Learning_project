json.extract! product, :id, :name, :description, :imags, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
json.description product.description.to_s
json.imags do
  json.array!(product.imags) do |imag|
    json.id imag.id
    json.url url_for(imag)
  end
end

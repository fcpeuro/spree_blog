object false
node(:count) { @categories.count }
child(@categories) do
  extends 'spree/api/categories/show'
end

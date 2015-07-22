object @post
attributes *post_attributes
child :author => :author do
  attributes *author_attributes
end

child :categories do
  attributes *category_attributes
end

child :related_posts do
  attributes *[:id, :title]
end

class AddPostAndTagToTaggings < ActiveRecord::Migration[5.0]
  def change
  	add_reference :taggings, :post, index: true
  	add_reference :taggings, :tag, index: true
  end
end

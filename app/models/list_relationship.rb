class ListRelationship < ActiveRecord::Base
  belongs_to :parent_list, class_name: "List"
  belongs_to :child_list, class_name: "List"

  validates :parent_list_id, presence: true
  validates :child_list_id, presence: true
end

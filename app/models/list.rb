class List < ActiveRecord::Base
  belongs_to :team

  # a list has only one relationship where it is the child
  has_one :parent_list_relationship, class_name: "ListRelationship", foreign_key: "child_list_id"
  # a list has many relationships where it is the parent
  has_many :child_list_relationships, class_name: "ListRelationship", foreign_key: "parent_list_id"

  # through the above relationships, a list has_one parent list and has_many child_lists
  has_one :parent_list, through: :parent_list_relationship, source: :parent_list
  has_many :child_lists, through: :child_list_relationships, source: :child_list, class_name: "List"

  before_destroy :destroy_child_lists

  def as_json(options={})
    super(:only => [:title, :id],
          :include => :child_lists
    )
  end

  private
    def destroy_child_lists
      self.child_lists.each do |cl|
        cl.destroy
      end
    end


end

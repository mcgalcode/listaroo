class List < ActiveRecord::Base
  has_many :list_items

  def as_json(options={})
    super(:only => [:title],
          :include => {
            :list_items => { :only => [:content] }
            }
    )
  end

end

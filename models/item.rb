class Item < ActiveRecord::Base
belongs_to :potluck
belongs_to :person

has_and_belongs_to_many :tags

def list_tags()

  result_string = ""
  if self.tags.count > 0

    self.tags.each_with_index do |tag, i|
      if i == 0
        result_string << tag.name
      else
        result_string << ", #{tag.name}"
      end
    end

  end
    result_string
end


end
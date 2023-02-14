class Blog < ApplicationRecord
    has_and_belongs_to_many :categories
    belongs_to :user
    validates :title, presence: true, length: {minimum: 2, maximum: 200}
    validates :content, presence: true, length: {minimum: 2, maximum: 200}

    validate :image_path_exists

    def image_path_exists
        require 'open-uri'

        begin
            # is the url valid?
            # if thrown an exception, then rescue will execute
            path = URI.open(image_path)
            # does the response have a content type image?
            errors.add(:image_path, "does not contain image content") and return unless path.content_type.starts_with?("image")
        rescue
            errors.add(:image_path, "invalid url")
        end        
    end
end

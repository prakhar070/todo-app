class Todo < ApplicationRecord
    #validates custom validation
    validate :deadline_must_make_sense
    #ensures that the title is present and is a minimum 3 characters long
    #two todos cannot have the same title
    validates :title, presence: true, length: { minimum: 3 }, uniqueness: true

    private
    def deadline_must_make_sense
        #if no deadline is provided
        if deadline.blank?
            errors.add(:deadline, "A deadline must be given")
        #if a deadline is provided but it's in the past
        elsif deadline and deadline < Date.today
            errors.add(:deadline, "Cannot set a todo for the past !!!")
        end
    end
end


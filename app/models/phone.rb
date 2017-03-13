class Phone < ApplicationRecord
  belongs_to :user
  # # def addphone
  #   @phone = @user.phones.create(phonenumber :"(626)213-4567")
  # end
end

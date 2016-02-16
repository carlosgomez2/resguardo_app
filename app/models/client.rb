class Client < ActiveRecord::Base
  has_many :packages, dependent: :destroy
end

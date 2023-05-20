# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :doctors
end

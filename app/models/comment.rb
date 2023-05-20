# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id             :bigint           not null, primary key
#  text           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  appointment_id :bigint
#
# Indexes
#
#  index_comments_on_appointment_id  (appointment_id)
#
class Comment < ApplicationRecord
  belongs_to :appointment
end

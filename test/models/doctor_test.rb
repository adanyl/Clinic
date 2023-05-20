# frozen_string_literal: true

# == Schema Information
#
# Table name: doctors
#
#  id                     :bigint           not null, primary key
#  description            :string           default("")
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  category_id            :bigint
#
# Indexes
#
#  index_doctors_on_category_id           (category_id)
#  index_doctors_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coupon, type: :model do
  it { is_expected.to validate_presence_of(:code) }
  it { is_expected.to validate_uniqueness_of(:code).case_insensitive }

  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to define_enum_for(:status).with_values({ active: 1, inative: 2 }) }

  it { is_expected.to validate_presence_of(:due_date) }
  it { is_expected.to validate_presence_of(:discount_value) }
  it { is_expected.to validate_numericality_of(:discount_value).is_greater_than(0) }

  it "can't have past date due_date" do
    subject.due_date = Time.zone.now - 2.day
    subject.valid?
    expect(subject.errors).to include :due_date
  end

  it "can't with current date due_date" do
    subject.due_date = Time.zone.now
    subject.valid?
    expect(subject.errors).to include :due_date
  end

  it 'is valid with future date' do
    subject.due_date = Time.zone.now + 1.day
    subject.valid?
    expect(subject.errors).to_not include :due_date
  end

  it_behaves_like 'paginatable concern', :coupon
end

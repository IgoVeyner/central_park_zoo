class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    raise "donations#create".inspect
  end
end

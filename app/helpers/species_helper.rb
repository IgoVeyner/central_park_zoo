module SpeciesHelper
  def total_donation_amount(user, species)
    user.total_donations_by_species(species)
  end
end

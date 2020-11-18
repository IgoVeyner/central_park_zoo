# Non-admin User creation
User.create(
  username: "Iggy95",
  password: "password",
  name: "Igor Veyner",
  birthdate: "1995-02-10",
  funds: 1000000
)

# Admin User creation
User.create(
  username: "sIrwin",
  password: "password",
  name: "Steve Irwin",
  birthdate: "1962-02-22",
  funds: 10000000,
  admin: true
)

# Exhibit creation
seal_pool = Exhibit.create(
  name: "Central Garden & Sea Lion Pool",
  biome: "Pacific Ocean coastline",
  image_url: "https://www.cooperation.com.au/Photo%20Albums/Canada-NYC%202006/10%20-%20New%20York%20City/slides/Sea%20Lion%20Central%20Park%20Zoo.JPG",
  description: "At the heart of the park, our sea lion gang can be seen sunning themselves or swimming amidst the Manhattan skyline. The exhibit features both above and below water viewing of some of our most acrobat swimmers."
)

# Species creation
seal = Species.create(
  name: "Zalophus californianus",
  common_name: "California Sea Lion",
  conservation_status: "Least Concern",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/7/74/California_sea_lion_in_La_Jolla_%2870568%29.jpg",
  description: "The California sea lion (Zalophus californianus) is a coastal eared seal native to western North America. It is one of six species of sea lion. Its natural habitat ranges from southeast Alaska to central Mexico, including the Gulf of California. They mainly haul-out on sandy or rocky beaches, but they also frequent manmade environments such as marinas and wharves. Sea lions feed on a number of species of fish and squid, and are preyed on by killer whales and great white sharks."
)

# Animal creation
Animal.create(
  name: "Maximillion",
  age: rand(1..20),
  weight: rand(5..50),
  image_url: "https://c532f75abb9c1c021b8c-e46e473f8aadb72cf2a8ea564b4e6a76.ssl.cf5.rackcdn.com/2020/04/09/h97t7yy8u_Julie_Larsen_Maher_5921_California_Sea_Lion_Show_with_trainer_SLP_CPZ_04_18_10_hr.jpg",
  description: "A sweetheart. Loves to eat fish",
  exhibit_id: seal_pool.id,
  species_id: seal.id
)
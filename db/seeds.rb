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
Exhibit.create(
  name: "Central Garden & Sea Lion Pool",
  biome: "Pacific Ocean coastline",
  image_url: "https://www.cooperation.com.au/Photo%20Albums/Canada-NYC%202006/10%20-%20New%20York%20City/slides/Sea%20Lion%20Central%20Park%20Zoo.JPG",
  description: "At the heart of the park, our sea lion gang can be seen sunning themselves or swimming amidst the Manhattan skyline. The exhibit features both above and below water viewing of some of our most acrobat swimmers."
)

# Species creation
Species.create(
  name: "Zalophus californianus",
  common_name: "California Sea Lion",
  conservation_status: "Least Concern",
  image_url: "https://en.wikipedia.org/wiki/California_sea_lion#/media/File:California_sea_lion_in_La_Jolla_(70568).jpg",
  description: "The California sea lion (Zalophus californianus) is a coastal eared seal native to western North America. It is one of six species of sea lion. Its natural habitat ranges from southeast Alaska to central Mexico, including the Gulf of California. They mainly haul-out on sandy or rocky beaches, but they also frequent manmade environments such as marinas and wharves. Sea lions feed on a number of species of fish and squid, and are preyed on by killer whales and great white sharks."
)
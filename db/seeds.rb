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
  image_url: "https://www.cooperation.com.au/Photo%20Albums/Canada-NYC%202006/10%20-%20New%20York%20City/slides/Sea%20Lion%20Central%20Park%20Zoo.JPG"
)
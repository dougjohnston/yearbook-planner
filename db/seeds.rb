# Create some basic data during development

# Create a school
school_one = School.create(name: "Alliance Academy International", short_name: "AAI", subdomain: 'aai')
school_two = School.create(name: "Rancho Bernardo High School", short_name: "RBHS", subdomain: 'rbhs')

# Create some users
User.create(school: school_one, email: "dbjohnston@aai.com", first_name: "Doug", last_name: "Johnston", password: "eoselan", password_confirmation: "eoselan")
User.create(school: school_two, email: "dbjohnston@rbhs.com", password: "eoselan", password_confirmation: "eoselan")

# Create a yearbook
Yearbook.create(school: School.first, starting_year: 2012, ending_year: 2013, title: "Survivors", theme: "Survivors")

# Create a section
Section.create(yearbook: Yearbook.first, title: "Elementary", position: 1)

# Create some spreads with pages
6.times do |i|
  spread = Spread.create(section: Section.first, position: i+1)
  Page.create(spread: spread, title: "Test Page ##{i+1*2-1}")
  Page.create(spread: spread, title: "Test Page ##{i+1*2}")
end

# Create some basic seed data for development

# Create two schools
School.create!(name: "Alliance Academy International", short_name: "AAI", subdomain: 'aai')
School.create!(name: "Rancho Bernardo High School", short_name: "RBHS", subdomain: 'rbhs')

# For each school some yearbooks with sections, spreads, and pages
School.all.each do |school|
  # Create two users and two yearbooks
  user1 = User.create!(school: school, email: "one@#{school.subdomain}.com", first_name: "Doug", last_name: "Johnston", password: "eoselan", password_confirmation: "eoselan")
  user2 = User.create!(school: school, email: "two@#{school.subdomain}.com", first_name: "Milton", last_name: "Coronel", password: "eoselan", password_confirmation: "eoselan")
  yearbook1 = Yearbook.create!(school: school, starting_year: 2012, ending_year: 2013, theme: "Survivors")
  yearbook2 = Yearbook.create!(school: school, starting_year: 2011, ending_year: 2012, theme: "Forever")

  Yearbook.all.each do |yb|
    # Create a few sections
    titles = %w(Elementary Seniors Athletics Academics Events)
    titles.shuffle.each_with_index do |title, i|
      section = Section.create!(yearbook: yb, title: title, position: i+1)

      # Create some spreads with pages
      6.times do |j|
        spread = Spread.create!(section: section, position: i+j)
        Page.create!(spread: spread, title: "Test Page ##{i+j*2-1}")
        Page.create!(spread: spread, title: "Test Page ##{i+j*2}")
        spread.assign_to(User.order('rand()').first)
      end
    end
  end
end

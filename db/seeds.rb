# Create some basic seed data for development

# Create two schools
School.create!(name: "Alliance Academy International", short_name: "AAI", subdomain: 'aai')
School.create!(name: "Rancho Bernardo High School", short_name: "RBHS", subdomain: 'rbhs')

# For each school, create some yearbooks with sections, spreads, and pages
School.all.each do |school|
  # Create two users
  User.create!(school: school, email: "one@#{school.subdomain}.com", first_name: "Doug", last_name: "Johnston", password: "eoselan", password_confirmation: "eoselan")
  User.create!(school: school, email: "two@#{school.subdomain}.com", first_name: "Milton", last_name: "Coronel", password: "eoselan", password_confirmation: "eoselan")

  # Create two yearbooks
  Yearbook.create!(school: school, starting_year: Time.now.year - 1, ending_year: Time.now.year, theme: "Survivors")
  Yearbook.create!(school: school, starting_year: Time.now.year - 2, ending_year: Time.now.year - 1, theme: "Forever")

  # Fill each yearbook with some stuff
  school.yearbooks.all.each do |yb|
    # Create two deadlines
    Deadline.create!(yearbook: yb, title: "First Deadline", description: "Our first deadline", due_date: Time.now + 10.days)
    Deadline.create!(yearbook: yb, title: "Second Deadline", description: "Our second deadline", due_date: Time.now + 50.days)

    # Create a few sections
    titles = %w(Elementary Seniors Athletics Academics Events)
    titles.shuffle.each_with_index do |title, i|
      section = Section.create!(yearbook: yb, title: title, section_order: i+1)
      section.assign_to(User.order('rand()').first)

      # Create some spreads
      6.times do |j|
        user = school.users.order('rand()').first
        deadline = yb.deadlines.order('rand()').first
        spread = Spread.create!(section: section, deadline: deadline, title: "#{title} Spread ##{i+j}", spread_order: i+j)
        spread.left_page.update_attribute(:title, "#{section} Test Page ##{i+j}")
        spread.right_page.update_attribute(:title, "#{section} Test Page ##{i+j+1}")
        spread.assign_to(user)
      end
    end
  end
end

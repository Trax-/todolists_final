# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoItem.destroy_all
TodoList.destroy_all

@users = User.create!([
    { username: 'Fiorina', password_digest: 'somepass' },
    { username: 'Trump', password_digest: 'diffpass' },
    { username: 'Carson', password_digest: 'ssomepas' },
    { username: 'Clinton', password_digest: 'sdiffpas' }
])

due_date = Date.today + 1.year
@users.each do |user|
  tl = TodoList.create!(list_name: "#{user.username}_list", list_due_date: due_date, user_id: user.id)
  (0..4).each do |i|
    TodoItem.create!(todo_list_id: tl.id, due_date: due_date, title: "listitem#{i}", description: "description#{i}")
  end
end

User.find_by!(username: 'Fiorina').create_profile(birth_year: 1954, gender: 'female', first_name: 'Carly', last_name: 'Fiorina')
User.find_by!(username: 'Trump').create_profile(birth_year: 1946, gender: 'male', first_name: 'Donald', last_name: 'Trump')
User.find_by!(username: 'Carson').create_profile(birth_year: 1951, gender: 'male', first_name: 'Ben', last_name: 'Carson')
User.find_by!(username: 'Clinton').create_profile(birth_year: 1947, gender: 'female', first_name: 'Hillary', last_name: 'Clinton')
